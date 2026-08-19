#
# Copyright 2026 NXP
#
# SPDX-License-Identifier: BSD-3-Clause
#
# MCUX integration for ExecuTorch. Defines the components that expose the
# ExecuTorch headers and the prebuilt runtime archive to SDK examples.
#
#   .executorch         ExecuTorch public headers + compile macros.
#   .executorch.neutron NXP Neutron delegate backend.
#   .executorch.binary  Prebuilt libexecutorch.a (built by
#                       build_executorch_runtime.sh), linked into examples.
#   .executorch.source  Optional: ship the runtime source for reference or
#                       source-level rebuild. Pack-only; not compiled here.
#
# The prebuilt libexecutorch.a lives at:
#   middleware/eiq/executorch/lib/<core>/<tc>/libexecutorch.a
# Rebuild it with middleware/eiq/executorch_build/build_executorch_runtime.sh.

if(CONFIG_MCUX_COMPONENT_middleware.eiq.executorch)
  # Headers shipped via mcux_add_source globs (sdkgen packs these); mcux_add_include
  # sets the search paths. Globs auto-adapt to upstream folder/op renames.
  mcux_add_source(
    BASE_PATH ${CMAKE_CURRENT_LIST_DIR}/../executorch
    SOURCES runtime/**.h
            kernels/**.h
            extension/**.h
            backends/nxp/**.h
            codegen/**.h
            schema/**.h
            third-party/flatbuffers/include/flatbuffers/**.h
  )
  # Include roots: `..` gives the <executorch/...> namespace; the c10 path hosts
  # the portable_type shim headers referenced by the public API.
  mcux_add_include(
    BASE_PATH ${CMAKE_CURRENT_LIST_DIR}/../executorch
    INCLUDES .
            ../
            third-party/flatbuffers/include
            runtime/core/portable_type/c10/
  )
  # NO_HEAP_USAGE: executorch uses static memory pools.
  # C10_USING_CUSTOM_GENERATED_MACROS: must match the prebuilt .a; without it
  # the compiler looks for the never-shipped cmake_macros.h and the build fails.
  mcux_add_macro(
    CC "NO_HEAP_USAGE=1 C10_USING_CUSTOM_GENERATED_MACROS=1"
    CX "NO_HEAP_USAGE=1 C10_USING_CUSTOM_GENERATED_MACROS=1"
  )
  mcux_add_armgcc_configuration(
    CC "-std=c99"
    CX "-std=c++17"
  )
  mcux_add_mdk_configuration(
    CX "-std=gnu++17"
    LD "--library_type=standardlib"
  )
endif()

if(CONFIG_MCUX_COMPONENT_middleware.eiq.executorch.neutron)
  # NXP Neutron delegate backend, linked against the platform Neutron archives.
  mcux_add_source(
    BASE_PATH ${CMAKE_CURRENT_LIST_DIR}/../executorch
    SOURCES backends/nxp/runtime/NeutronBackend.cpp
  )
  mcux_add_library(
    BASE_PATH ${CMAKE_CURRENT_LIST_DIR}/../executorch
    LIBS ../neutron/rt700/cm33/libNeutronDriver.a ../neutron/rt700/cm33/libNeutronFirmware.a
    TOOLCHAINS armgcc mcux
    DEVICE_IDS MIMXRT798S
  )
  mcux_add_library(
    BASE_PATH ${CMAKE_CURRENT_LIST_DIR}/../executorch
    LIBS ../neutron/rt700/hifi4/libNeutronDriver.a ../neutron/rt700/hifi4/libNeutronFirmware.a
    TOOLCHAINS xcc xtensa
    DEVICE_IDS MIMXRT798S
  )
endif()

if(CONFIG_MCUX_COMPONENT_middleware.eiq.executorch.binary)
  # Link the prebuilt runtime archive. It is a merge of the executorch native
  # archives produced by build_executorch_runtime.sh and is self-contained.
  mcux_add_library(
    BASE_PATH ${CMAKE_CURRENT_LIST_DIR}/../executorch
    LIBS lib/cm33/armgcc/libexecutorch.a
    TOOLCHAINS armgcc mcux
    CORES cm33 cm33f
  )
  mcux_add_library(
    BASE_PATH ${CMAKE_CURRENT_LIST_DIR}/../executorch
    LIBS lib/hifi4/xcc/imxrt700/libexecutorch.a
    TOOLCHAINS xcc xtensa
    CORE_IDS hifi4
    DEVICE_IDS MIMXRT798S
  )
endif()

if(CONFIG_MCUX_COMPONENT_middleware.eiq.executorch.source)
  # Ship the ExecuTorch runtime SOURCE (for reference / source-level rebuild).
  # The globs mirror what build_executorch_runtime.sh compiles into the merged
  # archives. PACK-ONLY: these .cpp are never compiled in the normal (binary)
  # build -- the runtime comes from libexecutorch.a linked above.
  mcux_add_source(
    BASE_PATH ${CMAKE_CURRENT_LIST_DIR}/../executorch
    SOURCES runtime/**.cpp
            kernels/portable/**.cpp
            kernels/quantized/**.cpp
            extension/runner_util/**.cpp
  )
endif()
