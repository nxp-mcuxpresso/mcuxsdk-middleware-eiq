if(CONFIG_MCUX_COMPONENT_middleware.eiq.tensorflow_lite_micro)
mcux_add_source(
    TOOLCHAINS iar
    BASE_PATH ${SdkRootDirPath}
    SOURCES middleware/eiq/common/toolchains/iar/retarget.c
)

mcux_add_source(
    TOOLCHAINS mdk
    BASE_PATH ${SdkRootDirPath}
    SOURCES middleware/eiq/common/toolchains/mdk/retarget.c
)
endif()

if(CONFIG_MCUX_COMPONENT_middleware.eiq.neutron)
  mcux_add_source(
    BASE_PATH ${CMAKE_CURRENT_LIST_DIR}
    SOURCES neutron/common/include/*.h
    neutron/driver/include/*.h
    )
  mcux_add_include(
    INCLUDES neutron/common/include
    neutron/driver/include
    )
  mcux_add_library(
    LIBS neutron/mcxn/libNeutronDriver.a neutron/mcxn/libNeutronFirmware.a
    TOOLCHAINS armgcc mcux mdk iar
    DEVICE_IDS MCXN947 MCXN547
    )
  mcux_add_library(
    LIBS neutron/rt700/cm33/libNeutronDriver.a neutron/rt700/cm33/libNeutronFirmware.a
    TOOLCHAINS armgcc mcux mdk iar
    DEVICE_IDS MIMXRT798S
    )
  mcux_add_library(
    LIBS neutron/rt700/hifi4/libNeutronDriver.a neutron/rt700/hifi4/libNeutronFirmware.a
    TOOLCHAINS xcc xtensa
    CORE_IDS hifi4
    DEVICE_IDS MIMXRT798S
    )
  mcux_add_library(
    LIBS neutron/rt2660/libNeutronDriver.a
    TOOLCHAINS armgcc mcux mdk iar
    DEVICE_IDS MIMXRT2662xxxxx
    )
  mcux_add_iar_configuration(
    LD "--diag_suppress Li026,Lt069"
    )
endif()

mcux_add_cmakelists(${SdkRootDirPath}/middleware/eiq/tensorflow-lite)
mcux_add_cmakelists(${SdkRootDirPath}/middleware/eiq/mpp)
mcux_add_cmakelists(${SdkRootDirPath}/middleware/eiq/ethos-u-core-software)

if(CONFIG_MCUX_COMPONENT_middleware.eiq.executorch)
    mcux_add_cmakelists(${SdkRootDirPath}/middleware/eiq/executorch/examples/nxp/runtime/imxrt700)
endif()
