
if(CONFIG_MCUX_COMPONENT_middleware.eiq.ethosu.application)
  mcux_add_include(
    INCLUDES applications/inference_process/include
             lib/crc/include
	     lib/ethosu_monitor/include
    )
  mcux_add_source(
    BASE_PATH ${CMAKE_CURRENT_LIST_DIR}
    SOURCES applications/inference_process/include/inference_process.hpp
	    applications/inference_process/include/inference_parser.hpp
            applications/inference_process/src/inference_process.cpp
	    lib/crc/include/crc.hpp
	    lib/ethosu_monitor/include/ethosu_monitor.hpp
	    lib/ethosu_monitor/src/ethosu_monitor.cpp
    )
endif()

if(CONFIG_MCUX_COMPONENT_middleware.eiq.ethosu.core_driver)
  mcux_add_include(
    INCLUDES core_driver/include
             core_driver/src
    )
  mcux_add_source(
    BASE_PATH ${CMAKE_CURRENT_LIST_DIR}
    SOURCES core_driver/src/ethosu_device.h
            core_driver/src/ethosu_interface.h
            core_driver/src/ethosu_log.h
            core_driver/src/ethosu_driver.c
            core_driver/src/ethosu_pmu.c
            core_driver/include/*.h
    )
  mcux_add_source(
    BASE_PATH ${CMAKE_CURRENT_LIST_DIR}
    SOURCES core_driver/src/ethosu55_interface.h
            core_driver/src/ethosu65_interface.h
            core_driver/src/ethosu_config_u55.h
            core_driver/src/ethosu_config_u65.h
            core_driver/src/ethosu_device_u55_u65.c
    DEVICE_IDS MIMX9322xxxxM
    DEVICE_IDS MIMX9352xxxxM
    DEVICE_IDS MIMX93W52xxxxxM
    )
  mcux_add_source(
    BASE_PATH ${CMAKE_CURRENT_LIST_DIR}
    SOURCES core_driver/src/ethosu85_interface.h
            core_driver/src/ethosu_config_u85.h
            core_driver/src/ethosu_device_u85.c
    DEVICE_IDS IMXRTL3759AAAxxxx
    )
endif()
