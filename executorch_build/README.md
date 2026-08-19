<!--
Copyright 2026 NXP
SPDX-License-Identifier: BSD-3-Clause
-->

# Building the ExecuTorch Runtime Library (`libexecutorch.a`)

This guide shows how to rebuild the ExecuTorch runtime library
(`libexecutorch.a`) from source for the NXP MCUXpresso SDK (MCUxpresso SDK),
for both the **Cortex-M33 (cm33)** and the **HiFi4 DSP (hifi4)** cores.

The SDK ships a **prebuilt** `libexecutorch.a` for each core so that the
`executorch_cifarnet` / `executorch_cifarnet_hifi4` examples link out of the box.
You only need this guide if you want to **rebuild the runtime from source** — for
example, to upgrade ExecuTorch, to debug the runtime, or to enable profiling.

(All of the following content is based on Linux OS)

---

## What gets built, and where it goes

`build_executorch_runtime.sh` drives ExecuTorch's **native** CMake build with the
target core's cross toolchain, then `ar`-merges the produced static archives into
a single self-contained `libexecutorch.a` and writes it **directly to the path
the examples consume**:

| Core | Output path (relative to the SDK root) |
|------|----------------------------------------|
| cm33 | `middleware/eiq/executorch/lib/cm33/armgcc/libexecutorch.a` |
| hifi4 | `middleware/eiq/executorch/lib/hifi4/xcc/imxrt700/libexecutorch.a` |

Because the script writes to the canonical path, **building the runtime also
replaces the prebuilt `.a` in place** — there is no separate copy step. After the
script finishes, just rebuild the example and it picks up the new library.

> The prebuilt `.a` is overwritten. Back it up first if you want to keep it:
> `cp <path>/libexecutorch.a <path>/libexecutorch.a.orig`.

---

## Prerequisites

### Common (both cores)

- **Python 3.10 or newer**, with `venv` / `pip`.
- The **ExecuTorch source tree**, located at `middleware/eiq/executorch/` in the
  SDK. It must be a **complete checkout including git submodules** (see Step 2).

### For `--core cm33`

- **ARM GCC toolchain** (`arm-none-eabi-gcc`, `arm-none-eabi-ar`). Set
  `ARMGCC_DIR` to the toolchain root; the script prepends `$ARMGCC_DIR/bin` to
  `PATH` automatically:
  ```bash
  export ARMGCC_DIR=/path/to/arm-gnu-toolchain-<version>-x86_64-arm-none-eabi
  ```

### For `--core hifi4`

- **Xtensa toolchain** for the HiFi4 core. Source its environment so that
  `xt-clang`, `xt-ar` are on `PATH` and these variables are set:
  ```bash
  export XCC_DIR=/path/to/xtensa/tools/<release>/XtensaTools
  export XTENSA_CORE=rt700_hifi4_RI23_11_nlib          # match your Xtensa build
  export XTENSA_SYSTEM=/path/to/xtensa/builds/<release>/rt700_hifi4_RI23_11_nlib/config
  ```
  (The exact core name and build path come with your Xtensa installation for the
  RT700 HiFi4 core.)

---

## Step 1 — Create a Python virtual environment

Create and activate a dedicated virtual environment for ExecuTorch. From the SDK
root:

```bash
python3 -m venv .venv-et
source .venv-et/bin/activate
python -m pip install --upgrade pip
```

> All commands in **Step 2** and **Step 3** must run with **this venv active**.
> The venv provides `flatc`, `cmake` and the `executorch` Python package that the
> build script relies on.

---

## Step 2 — Install the ExecuTorch Python package

From inside the activated venv:

```bash
cd middleware/eiq/executorch
./install_executorch.sh
```

What this does:
- Builds and installs the `executorch` Python package (editable install) into the
  venv — this also brings `flatc` and `cmake` onto the venv's PATH.
- Initializes the **required git submodules** (e.g. `flatbuffers`,
  `extension/llm/tokenizers`, `kernels/optimized/third-party/eigen`) via the
  built-in `check_and_update_submodules()` step.

**Submodule note:** `install_executorch.sh` can only init submodules if
`middleware/eiq/executorch/` is a real git checkout. If your SDK ships the
ExecuTorch tree as a plain (non-git) snapshot, obtain a full git checkout first
(e.g. `git clone --recursive` the matching ExecuTorch release into that path),
otherwise the install cannot fetch the required dependencies.

Verify the install:

```bash
python -c "import executorch; print('executorch OK')"
which flatc cmake    # both should resolve inside the venv
```

---

## Step 3 — Build the runtime library

From the SDK root, with the **ExecuTorch venv active** and the toolchain
environment exported (see *Prerequisites*):

### Cortex-M33

```bash
export ARMGCC_DIR=/path/to/arm-gnu-toolchain-<version>-x86_64-arm-none-eabi
bash middleware/eiq/executorch_build/build_executorch_runtime.sh --core cm33
```

### HiFi4 DSP

```bash
export XCC_DIR=...
export XTENSA_CORE=...
export XTENSA_SYSTEM=...
bash middleware/eiq/executorch_build/build_executorch_runtime.sh --core hifi4
```

On success the script prints the final archive, e.g.:

```
=== done ===
-rw-r--r-- ... middleware/eiq/executorch/lib/cm33/armgcc/libexecutorch.a
```

The new `libexecutorch.a` is now in place at the path the examples use —
**Step 4 (replacement) is already done.**

### Build modes (optional)

By default the script produces an **optimized release** build. Add independent,
combinable switches to change the build mode:

| Switch | Effect |
|--------|--------|
| *(none)* | Optimized release build (the prebuilt-equivalent). |
| `--debug` | `Debug` build (`-O0 -g`) with ExecuTorch logging enabled; implies `--verbose`. Lets you single-step the runtime. |
| `--profile` | Keeps Release optimization, turns on the event tracer (`-DET_EVENT_TRACER_ENABLED`) and builds/merges the devtools library (`etdump` + `flatccrt`) into the `.a`. |
| `--verbose` | Verbose build (`-v`) showing every compile command; also works standalone in release. |

Examples:

```bash
# Debuggable runtime
bash middleware/eiq/executorch_build/build_executorch_runtime.sh --core cm33 --debug

# Profiling-enabled runtime (records per-op timing into an etdump at run time)
bash middleware/eiq/executorch_build/build_executorch_runtime.sh --core cm33 --profile

# A debuggable, profiled runtime
bash middleware/eiq/executorch_build/build_executorch_runtime.sh --core hifi4 --debug --profile
```

Each mode builds into its own directory (`cmake-out[-debug][-profile]` /
`cmake-out-hifi4[-debug][-profile]`) so they never share a build tree, but the
produced `.a` always lands at the same fixed output path — each run overwrites
the previous mode. Re-run the mode you want before building the example.

> `--debug` produces a very large archive (~180 MB on cm33, ~215 MB on hifi4)
> because it contains full debug info. Only the loadable code is flashed to the
> board; debug info is stripped when the `.bin` is generated, so on-chip size
> stays small.

---

## Step 4 — (Automatic) the new library replaces the prebuilt one

Nothing to do — covered in Step 3. The script writes the merged archive straight
to `middleware/eiq/executorch/lib/<core>/<tc>/libexecutorch.a`, overwriting the
prebuilt copy. Just rebuild the example next.

---

## Step 5 — Build and run the examples

Building the SDK examples uses the **NXP west build environment**, which is a
**separate** Python environment from the ExecuTorch venv above (it needs the
`west` tool plus SDK build dependencies such as `pykwalify`). Activate it, then
run `west build` from the SDK root.

### `executorch_cifarnet` (Cortex-M33, single core)

```bash
west build -p always -b mimxrt700evk examples/eiq_examples/executorch_cifarnet \
    --toolchain armgcc -Dcore_id=cm33_core0 --config flash_release -d <build_dir>
```

The flashable ELF is `<build_dir>/executorch_cifarnet_cm33_core0.elf`.

### `executorch_cifarnet_hifi4` (HiFi4, multi-core sysbuild)

This example is multi-core: the Cortex-M33 image boots the HiFi4 DSP, which runs
the inference (and the Neutron NPU runs on the HiFi4 side). Build it with
`--sysbuild`:

```bash
west build -p always --sysbuild examples/eiq_examples/executorch_cifarnet_hifi4/cm \
    --toolchain armgcc -b mimxrt700evk -Dcore_id=cm33_core0 --config flash_release -d <build_dir>
```

The flashable ELF is `<build_dir>/cm/executorch_cifarnet_hifi4_cm33_core0.elf` (this is
the Cortex-M33 image; it bundles the HiFi4 DSP image and boots it at run time).

### Profiling variant (optional)

When you build a `--profile` runtime in Step 3, also pass
`-DETEXAMPLE_ENABLE_PROFILING=ON` to the example so it compiles with
`-DET_EVENT_TRACER_ENABLED`, wires an `ETDumpGen` into the runtime, and dumps the
captured etdump over the UART:

```bash
# cm33
west build -p always -b mimxrt700evk examples/eiq_examples/executorch_cifarnet \
    --toolchain armgcc -Dcore_id=cm33_core0 --config flash_release -d <build_dir> \
    -DETEXAMPLE_ENABLE_PROFILING=ON

# hifi4 (sysbuild) — must pass the flag to the HiFi4 sub-image explicitly
west build -p always --sysbuild examples/eiq_examples/executorch_cifarnet_hifi4/cm \
    --toolchain armgcc -b mimxrt700evk -Dcore_id=cm33_core0 --config flash_release -d <build_dir> \
    -DETEXAMPLE_ENABLE_PROFILING=ON \
    -Dexecutorch_cifarnet_hifi4_hifi4_ETEXAMPLE_ENABLE_PROFILING=ON
```

> **HiFi4 sysbuild note:** `west --sysbuild` does **not** forward ordinary `-D`
> variables to the DSP sub-image. Use the `-D<image-name>_<VAR>` form
> (`-Dexecutorch_cifarnet_hifi4_hifi4_ETEXAMPLE_ENABLE_PROFILING=ON`) to reach the
> HiFi4 build; otherwise the DSP side is built without profiling and produces no
> etdump.

### Flashing and running

Flash the ELF to the board with your usual tool (e.g. J-Link, CMSIS-DAP). The example prints inference results to the debug
UART at 115200 baud, e.g.:

```
CIFARNET example using a ExecuTorch model
Model executed successfully.
     Inference time: <N> us
     Detected: cat (99%)
```

For the profiling variant, an additional line is printed after inference:

```
ETDump: <size> bytes, <n> event blocks captured
<BDUMP>
<hex-encoded etdump>
<EDUMP>
```

Decode the hex dump on the host with the ExecuTorch Inspector to see per-op
timing (see the ExecuTorch devtools documentation).

---

## Troubleshooting

| Symptom | Fix |
|---------|-----|
| `ERROR: executorch is not installed in the current python environment` | Run Step 2 to install executorch into the active venv, then re-run Step 3 with that venv active. |
| `ERROR: arm-none-eabi-gcc not found` (cm33) | Set `ARMGCC_DIR` to your ARM GCC toolchain root (the script adds `$ARMGCC_DIR/bin` to PATH). |
| `ERROR: XCC_DIR not set` / `xt-clang not found` (hifi4) | Source your Xtensa toolchain environment first so `XCC_DIR`, `XTENSA_CORE`, `XTENSA_SYSTEM` are set and `xt-clang`/`xt-ar` are on PATH. |
| `install_executorch.sh` fails on missing submodules | `middleware/eiq/executorch/` must be a real git checkout; run `git submodule sync` and `git submodule update --init --recursive` inside it, or obtain a full `--recursive` clone of the matching ExecuTorch release. |
| `ModuleNotFoundError: No module named 'pykwalify'` (Step 5) | That is an SDK west-build dependency, not an ExecuTorch one — install the SDK's Python build requirements (`pip install pykwalify pyelftools jinja2 pyyaml west`, or use the SDK-provided requirements file) in the **west** environment. |
| hifi4 profiling link error `undefined reference to 'posix_memalign'` | Already handled by the script (it adds `-DFLATCC_USE_GENERIC_ALIGNED_ALLOC` for hifi4 profiling). Make sure you are using the bundled `build_executorch_runtime.sh` unmodified. |
| Link error `section .got overlaps section .model.init` (cm33 cifarnet) | The example's flash linker script accounts for the `.got` section; if you hit this, ensure you are using the example's stock linker script from `examples/_boards/.../gcc/`. |

---

## Reference

- Build script: `middleware/eiq/executorch_build/build_executorch_runtime.sh`
  (run `bash ... --help` for the full usage banner).
- SDK integration glue: `middleware/eiq/executorch_build/executorch.cmake` (links
  the prebuilt `libexecutorch.a` into the examples).
- ExecuTorch source: `middleware/eiq/executorch/` (a mirror of the upstream
  release — upgrade by replacing this tree, then re-run Step 3 per core).
