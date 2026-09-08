#!/usr/bin/env bash
#
# Copyright 2026 NXP
# SPDX-License-Identifier: BSD-3-Clause
#
# Build the ExecuTorch runtime library (libexecutorch.a) for an NXP core using
# ExecuTorch's native CMake build, then merge the produced archives into a single
# libexecutorch.a placed where the SDK examples consume it.
#
# Supported cores:
#   --core cm33   Cortex-M33, arm-none-eabi-gcc   -> lib/cm33/armgcc/libexecutorch.a
#   --core hifi4  HiFi4 DSP, xtensa xt-clang      -> lib/hifi4/xcc/imxrt700/libexecutorch.a
#
# Usage:
#   bash middleware/eiq/executorch_build/build_executorch_runtime.sh --core cm33
#   bash middleware/eiq/executorch_build/build_executorch_runtime.sh --core hifi4
#
# Build mode switches (independent, combinable; default = optimized release):
#   --debug     Debug build (-O0 -g) with ExecuTorch logging ON; implies --verbose.
#   --profile   Keep Release, enable the event tracer (-DET_EVENT_TRACER_ENABLED)
#               and merge the devtools runtime (etdump + flatccrt) into the .a.
#   --verbose   Verbose build (-v); also works standalone in release.
# The output .a always lands at the same fixed path; each run overwrites the
# previous build. Each mode uses its own cmake-out[-debug][-profile] build dir.
#
# Prerequisites:
#   - The executorch Python package installed in the active venv (run
#     middleware/eiq/executorch/install_executorch.sh first); it also provides
#     flatc and cmake.
#   - arm-none-eabi-gcc on PATH for --core cm33 (set ARMGCC_DIR to add its bin/
#     to PATH automatically).
#   - Xtensa env for --core hifi4: XCC_DIR, XTENSA_CORE, XTENSA_SYSTEM.
# See README.md for a full end-to-end walkthrough.

set -euo pipefail

# --- paths (script-relative so CWD does not matter) -------------------------
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
EIQ_DIR="${SCRIPT_DIR}/.."
ET_ROOT="${EIQ_DIR}/executorch"
SDK_ROOT="$(cd "${EIQ_DIR}/../.." && pwd)"

# Add $ARMGCC_DIR/bin to PATH for cm33 so arm-none-eabi-gcc/ar are found.
if [[ -n "${ARMGCC_DIR:-}" ]]; then
  export PATH="${ARMGCC_DIR}/bin:${PATH}"
fi

# --- argument parsing -------------------------------------------------------
CORE="cm33"
DEBUG=0
PROFILE=0
VERBOSE=0
while [[ $# -gt 0 ]]; do
  case "$1" in
    --core) CORE="$2"; shift 2 ;;
    --debug) DEBUG=1; shift ;;
    --profile) PROFILE=1; shift ;;
    --verbose) VERBOSE=1; shift ;;
    -h|--help)
      # Print the leading comment block (up to, excluding, 'set -euo pipefail').
      sed -n '2,/^set -euo pipefail$/p' "${BASH_SOURCE[0]}" | sed '/^set -euo pipefail$/d'
      exit 0 ;;
    *) echo "Unknown argument: $1" >&2; exit 1 ;;
  esac
done
# --debug implies verbose (single-stepping wants to see the compile commands).
if [[ "${DEBUG}" -eq 1 ]]; then
  VERBOSE=1
fi

# --- per-core configuration -------------------------------------------------
case "${CORE}" in
  cm33)
    BUILD_BASE="${ET_ROOT}/cmake-out"
    TOOLCHAIN="${SCRIPT_DIR}/arm-none-eabi-gcc.cmake"
    OUT_DIR="${ET_ROOT}/lib/cm33/armgcc"
    TARGET_CPU_CMAKE=(-DTARGET_CPU=cortex-m33)
    C_FLAGS=""
    CXX_FLAGS=""
    AR_TOOL="ar"
    CORE_DESC="Cortex-M33 (arm-none-eabi-gcc)"
    ;;
  hifi4)
    BUILD_BASE="${ET_ROOT}/cmake-out-hifi4"
    TOOLCHAIN="${SDK_ROOT}/cmake/toolchain/xtensa.cmake"
    OUT_DIR="${ET_ROOT}/lib/hifi4/xcc/imxrt700"
    TARGET_CPU_CMAKE=()  # xtensa.cmake reads XTENSA_CORE/XTENSA_SYSTEM from env
    # -stdlib=libc++ is required for C++ on xt-clang++ with newlib.
    C_FLAGS="-DXOS_CLOCK_FREQ=237500000 -mlongcalls"
    CXX_FLAGS="-stdlib=libc++ -std=c++17 -DXOS_CLOCK_FREQ=237500000 -mlongcalls"
    AR_TOOL="xt-ar"
    CORE_DESC="HiFi4 DSP (xtensa xt-clang)"
    ;;
  *)
    echo "ERROR: --core must be cm33 or hifi4 (got: ${CORE})" >&2; exit 1 ;;
esac
OUT_LIB="${OUT_DIR}/libexecutorch.a"

# --- build mode (debug / profile / verbose) ---------------------------------
# Separate build dir per mode so release/debug/profile never share a tree.
MODE_SUFFIX=""
[[ "${DEBUG}" -eq 1 ]] && MODE_SUFFIX+="-debug"
[[ "${PROFILE}" -eq 1 ]] && MODE_SUFFIX+="-profile"
BUILD="${BUILD_BASE}${MODE_SUFFIX}"

if [[ "${DEBUG}" -eq 1 ]]; then
  BUILD_TYPE="Debug"
  ET_LOGGING_CMAKE=(-DEXECUTORCH_ENABLE_LOGGING=ON)
else
  BUILD_TYPE="Release"
  ET_LOGGING_CMAKE=()
  C_FLAGS+=" -DET_LOG_ENABLED=0"     # keep the release binary small
  CXX_FLAGS+=" -DET_LOG_ENABLED=0"
fi

if [[ "${PROFILE}" -eq 1 ]]; then
  PROFILE_CMAKE=(-DEXECUTORCH_ENABLE_EVENT_TRACER=ON -DEXECUTORCH_BUILD_DEVTOOLS=ON)
  # hifi4's XOS libc lacks posix_memalign used by flatccrt's default allocator;
  # use flatcc's portable malloc/free-only allocator instead.
  if [[ "${CORE}" == "hifi4" ]]; then
    C_FLAGS+=" -DFLATCC_USE_GENERIC_ALIGNED_ALLOC"
  fi
else
  PROFILE_CMAKE=(-DEXECUTORCH_BUILD_DEVTOOLS=OFF)
fi

VERBOSE_CMAKE=()
[[ "${VERBOSE}" -eq 1 ]] && VERBOSE_CMAKE=(-DCMAKE_VERBOSE_MAKEFILE=ON)

# --- preflight checks -------------------------------------------------------
if [[ ! -f "${TOOLCHAIN}" ]]; then
  echo "ERROR: toolchain file not found: ${TOOLCHAIN}" >&2; exit 1
fi
if ! python -c "import executorch" >/dev/null 2>&1; then
  echo "ERROR: executorch is not installed in the current python environment." >&2
  echo "       Install it first with install_executorch.sh, then re-run this script." >&2; exit 1
fi
case "${CORE}" in
  cm33)
    if ! command -v arm-none-eabi-gcc >/dev/null 2>&1; then
      echo "ERROR: arm-none-eabi-gcc not found." >&2
      echo "       Set ARMGCC_DIR to the ARM GCC toolchain root (\$ARMGCC_DIR/bin is auto-added to PATH)," >&2
      echo "       or add arm-none-eabi-gcc to PATH manually." >&2; exit 1
    fi
    ;;
  hifi4)
    : "${XCC_DIR:?ERROR: XCC_DIR not set -- source the xtensa toolchain env first}"
    : "${XTENSA_CORE:?ERROR: XTENSA_CORE not set -- source the xtensa toolchain env first}"
    : "${XTENSA_SYSTEM:?ERROR: XTENSA_SYSTEM not set -- source the xtensa toolchain env first}"
    if ! command -v xt-clang >/dev/null 2>&1; then
      echo "ERROR: xt-clang not found on PATH (XCC_DIR/bin)." >&2; exit 1
    fi
    if ! command -v xt-ar >/dev/null 2>&1; then
      echo "ERROR: xt-ar not found on PATH (XCC_DIR/bin)." >&2; exit 1
    fi
    ;;
esac

echo "=== ExecuTorch runtime library build (${CORE}) ==="
echo "core       : ${CORE_DESC}"
echo "build type : ${BUILD_TYPE} (debug=${DEBUG}, profiling=${PROFILE}, verbose=${VERBOSE})"
echo "ET_ROOT    : ${ET_ROOT}"
echo "BUILD      : ${BUILD}"
echo "TOOLCHAIN  : ${TOOLCHAIN}"
echo "OUTPUT     : ${OUT_LIB}"
if [[ "${CORE}" == "hifi4" ]]; then
  echo "XTENSA_CORE: ${XTENSA_CORE}"
  echo "compiler  : $(command -v xt-clang++)"
else
  echo "compiler  : $(command -v arm-none-eabi-gcc)"
fi
echo "flatc     : $(command -v flatc || echo '(provided by venv cmake codegen)')"

# --- configure --------------------------------------------------------------
# CMAKE_POSITION_INDEPENDENT_CODE=OFF is required: -fPIC (executorch's default)
# emits a .got that overlaps the example's model section at link time.
cmake -S "${ET_ROOT}" -B "${BUILD}" \
  -DCMAKE_TOOLCHAIN_FILE="${TOOLCHAIN}" \
  -DCMAKE_BUILD_TYPE="${BUILD_TYPE}" \
  "${TARGET_CPU_CMAKE[@]}" \
  "${ET_LOGGING_CMAKE[@]}" \
  "${PROFILE_CMAKE[@]}" \
  "${VERBOSE_CMAKE[@]}" \
  -DEXECUTORCH_BUILD_PORTABLE_OPS=ON \
  -DEXECUTORCH_BUILD_KERNELS_QUANTIZED=ON \
  -DEXECUTORCH_BUILD_EXTENSION_RUNNER_UTIL=ON \
  -DEXECUTORCH_BUILD_EXECUTOR_RUNNER=OFF \
  -DEXECUTORCH_BUILD_PTHREADPOOL=OFF \
  -DEXECUTORCH_BUILD_CPUINFO=OFF \
  -DEXECUTORCH_BUILD_PYBIND=OFF \
  -DEXECUTORCH_BUILD_TESTS=OFF \
  -DEXECUTORCH_BUILD_ARM_BAREMETAL=OFF \
  -DEXECUTORCH_BUILD_CORTEX_M=OFF \
  -DCMAKE_POSITION_INDEPENDENT_CODE=OFF \
  -DCMAKE_C_FLAGS="${C_FLAGS}" \
  -DCMAKE_CXX_FLAGS="${CXX_FLAGS}"

# --- build ------------------------------------------------------------------
# Build only the targets whose archives are merged below; building 'all' pulls
# in many unneeded tests/benchmarks and some targets fail to cross-compile.
BUILD_TARGETS=(
  executorch executorch_core portable_kernels quantized_kernels \
  kernels_util_all_deps extension_runner_util
)
if [[ "${PROFILE}" -eq 1 ]]; then
  BUILD_TARGETS+=(etdump flatccrt)
fi
VERBOSE_FLAG=()
[[ "${VERBOSE}" -eq 1 ]] && VERBOSE_FLAG=(-v)

cmake --build "${BUILD}" -j"$(nproc)" "${VERBOSE_FLAG[@]}" --target "${BUILD_TARGETS[@]}"

# --- merge the archives into one libexecutorch.a ----------------------------
LIBS=(
  "${BUILD}/libexecutorch.a"
  "${BUILD}/libexecutorch_core.a"
  "${BUILD}/kernels/portable/libportable_kernels.a"
  "${BUILD}/kernels/portable/cpu/util/libkernels_util_all_deps.a"
  "${BUILD}/kernels/quantized/libquantized_kernels.a"
  "${BUILD}/extension/runner_util/libextension_runner_util.a"
)
PREFIXES=(
  "et_" "et_core_" "portable_kernels_" "kernels_util_" "quantized_kernels_" "runner_util_"
)

# Profiling also merges the devtools runtime (etdump + flatccrt). flatccrt is
# written into the source tree by the flatcc subdirectory (third-party/flatcc/lib).
if [[ "${PROFILE}" -eq 1 ]]; then
  LIBS+=(
    "${BUILD}/devtools/etdump/libetdump.a"
    "${ET_ROOT}/third-party/flatcc/lib/libflatccrt.a"
  )
  PREFIXES+=("etdump_" "flatccrt_")
  # The host-built flatcc_ep also writes libflatccrt.a to this path, so the
  # cross-compiled flatccrt target can look up-to-date and never relink, which
  # merges host objects into the target .a. Force a relink.
  rm -f "${ET_ROOT}/third-party/flatcc/lib/libflatccrt.a"
  cmake --build "${BUILD}" --target flatccrt
fi

mkdir -p "${OUT_DIR}"
TMP="${BUILD}/merge_tmp"
rm -rf "${TMP}" "${OUT_LIB}"
mkdir -p "${TMP}"

# merge_one: extract one archive, prefix every object (to avoid name clashes
# across archives), and append to OUT_LIB. Object extension differs per core
# (.obj on cm33, .o on hifi4); rename all files unconditionally.
merge_one() {  # $1 = archive path, $2 = object-name prefix
  local archive="$1" prefix="$2"
  if [[ ! -f "${archive}" ]]; then
    echo "ERROR: expected archive not found: ${archive}" >&2; exit 1
  fi
  ( cd "${TMP}" \
      && rm -rf ./* \
      && "${AR_TOOL}" -x "${archive}" \
      && n=$(ls -1 2>/dev/null | wc -l) \
      && if [[ "${n}" -eq 0 ]]; then \
           echo "ERROR: ${AR_TOOL} -x produced no objects from ${archive}" >&2; exit 1; fi \
      && for f in *; do mv "$f" "${prefix}$f"; done \
      && "${AR_TOOL}" -qcs "${OUT_LIB}" * )
}

echo "=== merging ${#LIBS[@]} archives -> ${OUT_LIB} (ar=${AR_TOOL}) ==="
for i in "${!LIBS[@]}"; do
  echo "  + ${LIBS[$i]}"
  merge_one "${LIBS[$i]}" "${PREFIXES[$i]}"
done
"${AR_TOOL}" -s "${OUT_LIB}"
rm -rf "${TMP}"

echo "=== done ==="
ls -la "${OUT_LIB}"
echo "Run 'nm ${OUT_LIB} | grep \" U \"' to confirm no executorch-internal undefined symbols."
