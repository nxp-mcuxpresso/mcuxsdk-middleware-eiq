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

mcux_add_cmakelists(${SdkRootDirPath}/middleware/eiq/tensorflow-lite)
