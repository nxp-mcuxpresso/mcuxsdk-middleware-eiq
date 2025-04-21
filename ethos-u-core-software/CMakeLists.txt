
if(CONFIG_MCUX_COMPONENT_middleware.eiq.ethosu.application)
  mcux_add_include(
    INCLUDES applications/inference_process/include
             lib/crc/include
             lib/ethosu_log/include
	     lib/ethosu_monitor/include
    )
  mcux_add_source(
    BASE_PATH ${CMAKE_CURRENT_LIST_DIR}
    SOURCES applications/inference_process/include/inference_process.hpp
	    applications/inference_process/include/inference_parser.hpp
            applications/inference_process/src/inference_process.cpp
	    lib/crc/include/crc.hpp
	    lib/ethosu_monitor/include/ethosu_monitor.hpp
	    lib/ethosu_log/include/ethosu_log.h
	    lib/ethosu_monitor/src/ethosu_monitor.cpp
    )
endif()

if(CONFIG_MCUX_COMPONENT_middleware.eiq.ethosu.core_driver)
  mcux_add_include(
    INCLUDES core_driver/include
    )
  mcux_add_source(
    BASE_PATH ${CMAKE_CURRENT_LIST_DIR}
    SOURCES core_driver/src/*.h
            core_driver/src/*.c
            core_driver/include/*.h
    )
endif()
