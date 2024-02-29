include_guard(GLOBAL)


if (CONFIG_USE_middleware_eiq_deepviewrt_deps_flatcc)
# Add set(CONFIG_USE_middleware_eiq_deepviewrt_deps_flatcc true) in config.cmake to use this component

message("middleware_eiq_deepviewrt_deps_flatcc component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if((CONFIG_BOARD STREQUAL evkbmimxrt1170 OR CONFIG_BOARD STREQUAL evkmimxrt1170 OR CONFIG_BOARD STREQUAL evkmimxrt1160 OR CONFIG_BOARD STREQUAL evkbmimxrt1060 OR CONFIG_BOARD STREQUAL evkmimxrt1060 OR CONFIG_BOARD STREQUAL evkbimxrt1050 OR CONFIG_BOARD STREQUAL evkmimxrt1040 OR CONFIG_BOARD STREQUAL evkmimxrt1064))

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/./deepviewrt/deps/flatcc/include
)

else()

message(SEND_ERROR "middleware_eiq_deepviewrt_deps_flatcc dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_middleware_eiq_deepviewrt_deps_json)
# Add set(CONFIG_USE_middleware_eiq_deepviewrt_deps_json true) in config.cmake to use this component

message("middleware_eiq_deepviewrt_deps_json component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if((CONFIG_BOARD STREQUAL evkbmimxrt1170 OR CONFIG_BOARD STREQUAL evkmimxrt1170 OR CONFIG_BOARD STREQUAL evkmimxrt1160 OR CONFIG_BOARD STREQUAL evkbmimxrt1060 OR CONFIG_BOARD STREQUAL evkmimxrt1060 OR CONFIG_BOARD STREQUAL evkbimxrt1050 OR CONFIG_BOARD STREQUAL evkmimxrt1040 OR CONFIG_BOARD STREQUAL evkmimxrt1064))

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/./deepviewrt/deps/json/flex.c
  ${CMAKE_CURRENT_LIST_DIR}/./deepviewrt/deps/json/reader.c
  ${CMAKE_CURRENT_LIST_DIR}/./deepviewrt/deps/json/safe.c
  ${CMAKE_CURRENT_LIST_DIR}/./deepviewrt/deps/json/writer.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/./deepviewrt/deps/json/include
)

else()

message(SEND_ERROR "middleware_eiq_deepviewrt_deps_json dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_middleware_eiq_deepviewrt_deps_stb)
# Add set(CONFIG_USE_middleware_eiq_deepviewrt_deps_stb true) in config.cmake to use this component

message("middleware_eiq_deepviewrt_deps_stb component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if((CONFIG_BOARD STREQUAL evkbmimxrt1170 OR CONFIG_BOARD STREQUAL evkmimxrt1170 OR CONFIG_BOARD STREQUAL evkmimxrt1160 OR CONFIG_BOARD STREQUAL evkbmimxrt1060 OR CONFIG_BOARD STREQUAL evkmimxrt1060 OR CONFIG_BOARD STREQUAL evkbimxrt1050 OR CONFIG_BOARD STREQUAL evkmimxrt1040 OR CONFIG_BOARD STREQUAL evkmimxrt1064))

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/./deepviewrt/deps/stb/stb_image.c
  ${CMAKE_CURRENT_LIST_DIR}/./deepviewrt/deps/stb/stb_image_resize.c
  ${CMAKE_CURRENT_LIST_DIR}/./deepviewrt/deps/stb/stb_image_write.c
  ${CMAKE_CURRENT_LIST_DIR}/./deepviewrt/deps/stb/stb_sprintf.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/./deepviewrt/deps/stb/include
)

else()

message(SEND_ERROR "middleware_eiq_deepviewrt_deps_stb dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_middleware_eiq_deepviewrt_modelrunner_server)
# Add set(CONFIG_USE_middleware_eiq_deepviewrt_modelrunner_server true) in config.cmake to use this component

message("middleware_eiq_deepviewrt_modelrunner_server component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if((CONFIG_DEVICE_ID STREQUAL MIMXRT1042xxxxB OR CONFIG_DEVICE_ID STREQUAL MIMXRT1052xxxxB OR CONFIG_DEVICE_ID STREQUAL MIMXRT1062xxxxA OR CONFIG_DEVICE_ID STREQUAL MIMXRT1062xxxxB OR CONFIG_DEVICE_ID STREQUAL MIMXRT1064xxxxA OR CONFIG_DEVICE_ID STREQUAL MIMXRT1064xxxxB OR CONFIG_DEVICE_ID STREQUAL MIMXRT1176xxxxx OR CONFIG_DEVICE_ID STREQUAL MIMXRT1166xxxxx))

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/./deepviewrt/include
)

if((CONFIG_TOOLCHAIN STREQUAL mcux OR CONFIG_TOOLCHAIN STREQUAL armgcc))
  target_link_libraries(${MCUX_SDK_PROJECT_NAME} PRIVATE
    -Wl,--start-group
      ${CMAKE_CURRENT_LIST_DIR}/./deepviewrt/lib/libmodelrunner-rt.a
      -Wl,--end-group
  )
endif()

else()

message(SEND_ERROR "middleware_eiq_deepviewrt_modelrunner_server dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_middleware_eiq_deepviewrt_modelrunner_server_flash)
# Add set(CONFIG_USE_middleware_eiq_deepviewrt_modelrunner_server_flash true) in config.cmake to use this component

message("middleware_eiq_deepviewrt_modelrunner_server_flash component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if((CONFIG_DEVICE_ID STREQUAL MIMXRT1042xxxxB OR CONFIG_DEVICE_ID STREQUAL MIMXRT1052xxxxB OR CONFIG_DEVICE_ID STREQUAL MIMXRT1062xxxxA OR CONFIG_DEVICE_ID STREQUAL MIMXRT1062xxxxB OR CONFIG_DEVICE_ID STREQUAL MIMXRT1064xxxxA OR CONFIG_DEVICE_ID STREQUAL MIMXRT1064xxxxB OR CONFIG_DEVICE_ID STREQUAL MIMXRT1176xxxxx OR CONFIG_DEVICE_ID STREQUAL MIMXRT1166xxxxx))

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/./deepviewrt/include
)

if((CONFIG_TOOLCHAIN STREQUAL mcux OR CONFIG_TOOLCHAIN STREQUAL armgcc))
  target_link_libraries(${MCUX_SDK_PROJECT_NAME} PRIVATE
    -Wl,--start-group
      ${CMAKE_CURRENT_LIST_DIR}/./deepviewrt/lib/libmodelrunner-rt-flash.a
      -Wl,--end-group
  )
endif()

else()

message(SEND_ERROR "middleware_eiq_deepviewrt_modelrunner_server_flash dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_middleware_eiq_deepviewrt_nnlib)
# Add set(CONFIG_USE_middleware_eiq_deepviewrt_nnlib true) in config.cmake to use this component

message("middleware_eiq_deepviewrt_nnlib component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if((CONFIG_DEVICE_ID STREQUAL MIMXRT1042xxxxB OR CONFIG_DEVICE_ID STREQUAL MIMXRT1052xxxxB OR CONFIG_DEVICE_ID STREQUAL MIMXRT1062xxxxA OR CONFIG_DEVICE_ID STREQUAL MIMXRT1062xxxxB OR CONFIG_DEVICE_ID STREQUAL MIMXRT1064xxxxA OR CONFIG_DEVICE_ID STREQUAL MIMXRT1064xxxxB OR CONFIG_DEVICE_ID STREQUAL MIMXRT1176xxxxx OR CONFIG_DEVICE_ID STREQUAL MIMXRT1166xxxxx))

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/./deepviewrt/include
)

if((CONFIG_TOOLCHAIN STREQUAL mcux OR CONFIG_TOOLCHAIN STREQUAL armgcc))
  target_link_libraries(${MCUX_SDK_PROJECT_NAME} PRIVATE
    -Wl,--start-group
      ${CMAKE_CURRENT_LIST_DIR}/./deepviewrt/lib/libdeepview-rt-cortex-m7f.a
      -Wl,--end-group
  )
endif()

else()

message(SEND_ERROR "middleware_eiq_deepviewrt_nnlib dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_middleware_eiq_glow)
# Add set(CONFIG_USE_middleware_eiq_glow true) in config.cmake to use this component

message("middleware_eiq_glow component is included from ${CMAKE_CURRENT_LIST_FILE}.")

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/./glow/bundle_utils/glow_bundle_utils.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/./glow/bundle_utils
)


endif()


if (CONFIG_USE_middleware_eiq_mpp)
# Add set(CONFIG_USE_middleware_eiq_mpp true) in config.cmake to use this component

message("middleware_eiq_mpp component is included from ${CMAKE_CURRENT_LIST_FILE}.")

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/./mpp/hal/hal_camera_mipi_ov5640.c
  ${CMAKE_CURRENT_LIST_DIR}/./mpp/hal/hal_camera_ezh_ov7670.c
  ${CMAKE_CURRENT_LIST_DIR}/./mpp/hal/hal_display_lcdifv2_rk055ahd091.c
  ${CMAKE_CURRENT_LIST_DIR}/./mpp/hal/hal_camera_csi_mt9m114.c
  ${CMAKE_CURRENT_LIST_DIR}/./mpp/hal/hal_display_lcdif_rk043fn.c
  ${CMAKE_CURRENT_LIST_DIR}/./mpp/hal/hal_display_mculcd_ssd1963.c
  ${CMAKE_CURRENT_LIST_DIR}/./mpp/hal/hal_draw.c
  ${CMAKE_CURRENT_LIST_DIR}/./mpp/hal/hal_freertos.c
  ${CMAKE_CURRENT_LIST_DIR}/./mpp/hal/hal_graphics_pxp.c
  ${CMAKE_CURRENT_LIST_DIR}/./mpp/hal/hal_graphics_cpu.c
  ${CMAKE_CURRENT_LIST_DIR}/./mpp/hal/hal_static_image.c
  ${CMAKE_CURRENT_LIST_DIR}/./mpp/hal/hal_utils.c
  ${CMAKE_CURRENT_LIST_DIR}/./mpp/hal/hal_vision_algo_tflite.c
  ${CMAKE_CURRENT_LIST_DIR}/./mpp/hal/hal_vision_algo_glow.c
  ${CMAKE_CURRENT_LIST_DIR}/./mpp/hal/hal_vision_algo_deep_view_rt.c
  ${CMAKE_CURRENT_LIST_DIR}/./mpp/hal/tflite/model.cpp
  ${CMAKE_CURRENT_LIST_DIR}/./mpp/hal/tflite/model_all_ops_micro.cpp
  ${CMAKE_CURRENT_LIST_DIR}/./mpp/hal/glow/model.cpp
  ${CMAKE_CURRENT_LIST_DIR}/./mpp/hal/deep_view_rt/model.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/./mpp/include
  ${CMAKE_CURRENT_LIST_DIR}/./mpp/hal/include
)

if(CONFIG_USE_COMPONENT_CONFIGURATION)
  message("===>Import configuration from ${CMAKE_CURRENT_LIST_FILE}")

  if(CONFIG_TOOLCHAIN STREQUAL iar)
    target_compile_options(${MCUX_SDK_PROJECT_NAME} PUBLIC
      --compiler_language=auto
      --diag_suppress Pa082,Pa084,Pa093,Pe111,Pe161,Pe174,Pe177,Pe186,Pe550,Pe611,Pe997,Pe1444
      --dlib_config full
      --enable_restrict
      --fno-rtti
      --fno-exceptions
      --c++
    )
  endif()
  if(CONFIG_TOOLCHAIN STREQUAL mdk)
    target_compile_options(${MCUX_SDK_PROJECT_NAME} PUBLIC
      -ffp-mode=full
      -fno-exceptions
      -std=gnu++11
      -Wno-c++17-extensions
    )
  endif()
  if(CONFIG_TOOLCHAIN STREQUAL armgcc)
    target_compile_options(${MCUX_SDK_PROJECT_NAME} PUBLIC
      -Wall
      -Wno-strict-aliasing
      -fno-rtti
      -fno-exceptions
      -Wno-sign-compare
    )
  endif()
  if(CONFIG_TOOLCHAIN STREQUAL mcux)
    target_compile_options(${MCUX_SDK_PROJECT_NAME} PUBLIC
      -Wno-strict-aliasing
      -fno-rtti
      -fno-exceptions
      -Wno-sign-compare
    )
  endif()

endif()

if((CONFIG_TOOLCHAIN STREQUAL mcux OR CONFIG_TOOLCHAIN STREQUAL armgcc) AND CONFIG_CORE STREQUAL cm7f)
  target_link_libraries(${MCUX_SDK_PROJECT_NAME} PRIVATE
    -Wl,--start-group
      ${CMAKE_CURRENT_LIST_DIR}/./mpp/lib/cm7/libmpp.a
      -Wl,--end-group
  )
endif()


endif()


if (CONFIG_USE_middleware_eiq_tensorflow_lite_micro_third_party_fft2d)
# Add set(CONFIG_USE_middleware_eiq_tensorflow_lite_micro_third_party_fft2d true) in config.cmake to use this component

message("middleware_eiq_tensorflow_lite_micro_third_party_fft2d component is included from ${CMAKE_CURRENT_LIST_FILE}.")

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/./tensorflow-lite/third_party/fft2d/fftsg.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/./tensorflow-lite/third_party/fft2d
)


endif()


if (CONFIG_USE_middleware_eiq_tensorflow_lite_micro_third_party_flatbuffers)
# Add set(CONFIG_USE_middleware_eiq_tensorflow_lite_micro_third_party_flatbuffers true) in config.cmake to use this component

message("middleware_eiq_tensorflow_lite_micro_third_party_flatbuffers component is included from ${CMAKE_CURRENT_LIST_FILE}.")

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/./tensorflow-lite/third_party/flatbuffers/include
)


endif()


if (CONFIG_USE_middleware_eiq_tensorflow_lite_micro_third_party_gemmlowp)
# Add set(CONFIG_USE_middleware_eiq_tensorflow_lite_micro_third_party_gemmlowp true) in config.cmake to use this component

message("middleware_eiq_tensorflow_lite_micro_third_party_gemmlowp component is included from ${CMAKE_CURRENT_LIST_FILE}.")

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/./tensorflow-lite/third_party/gemmlowp
)


endif()


if (CONFIG_USE_middleware_eiq_tensorflow_lite_micro_third_party_ruy)
# Add set(CONFIG_USE_middleware_eiq_tensorflow_lite_micro_third_party_ruy true) in config.cmake to use this component

message("middleware_eiq_tensorflow_lite_micro_third_party_ruy component is included from ${CMAKE_CURRENT_LIST_FILE}.")

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/./tensorflow-lite/third_party/ruy
)


endif()


if (CONFIG_USE_middleware_eiq_tensorflow_lite_micro)
# Add set(CONFIG_USE_middleware_eiq_tensorflow_lite_micro true) in config.cmake to use this component

message("middleware_eiq_tensorflow_lite_micro component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if(CONFIG_USE_middleware_eiq_tensorflow_lite_micro_headers AND CONFIG_USE_middleware_eiq_tensorflow_lite_micro_third_party_kissfft)

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/signal/micro/kernels/delay.cpp
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/signal/micro/kernels/energy.cpp
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/signal/micro/kernels/fft_auto_scale.cpp
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/signal/micro/kernels/filter_bank.cpp
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/signal/micro/kernels/filter_bank_log.cpp
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/signal/micro/kernels/filter_bank_spectral_subtraction.cpp
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/signal/micro/kernels/filter_bank_square_root.cpp
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/signal/micro/kernels/framer.cpp
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/signal/micro/kernels/irfft.cpp
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/signal/micro/kernels/overlap_add.cpp
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/signal/micro/kernels/pcan.cpp
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/signal/micro/kernels/rfft.cpp
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/signal/micro/kernels/stacker.cpp
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/signal/micro/kernels/window.cpp
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/signal/src/circular_buffer.cpp
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/signal/src/energy.cpp
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/signal/src/fft_auto_scale.cpp
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/signal/src/filter_bank.cpp
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/signal/src/filter_bank_log.cpp
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/signal/src/filter_bank_spectral_subtraction.cpp
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/signal/src/filter_bank_square_root.cpp
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/signal/src/irfft_float.cpp
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/signal/src/irfft_int16.cpp
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/signal/src/irfft_int32.cpp
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/signal/src/log.cpp
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/signal/src/max_abs.cpp
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/signal/src/msb_32.cpp
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/signal/src/msb_64.cpp
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/signal/src/overlap_add.cpp
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/signal/src/pcan_argc_fixed.cpp
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/signal/src/rfft_float.cpp
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/signal/src/rfft_int16.cpp
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/signal/src/rfft_int32.cpp
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/signal/src/square_root_32.cpp
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/signal/src/square_root_64.cpp
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/signal/src/window.cpp
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/signal/src/kiss_fft_wrappers/kiss_fft_float.cpp
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/signal/src/kiss_fft_wrappers/kiss_fft_int16.cpp
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/signal/src/kiss_fft_wrappers/kiss_fft_int32.cpp
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/tensorflow/lite/core/api/error_reporter.cpp
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/tensorflow/lite/core/api/flatbuffer_conversions.cpp
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/tensorflow/lite/core/api/tensor_utils.cpp
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/tensorflow/lite/core/c/common.cpp
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/tensorflow/lite/kernels/kernel_util.cpp
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/tensorflow/lite/kernels/internal/common.cpp
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/tensorflow/lite/kernels/internal/portable_tensor_utils.cpp
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/tensorflow/lite/kernels/internal/quantization_util.cpp
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/tensorflow/lite/kernels/internal/tensor_ctypes.cpp
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/tensorflow/lite/kernels/internal/tensor_utils.cpp
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/tensorflow/lite/kernels/internal/reference/comparisons.cpp
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/tensorflow/lite/kernels/internal/reference/portable_tensor_utils.cpp
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/tensorflow/lite/micro/fake_micro_context.cpp
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/tensorflow/lite/micro/flatbuffer_utils.cpp
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/tensorflow/lite/micro/memory_helpers.cpp
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/tensorflow/lite/micro/micro_allocation_info.cpp
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/tensorflow/lite/micro/micro_allocator.cpp
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/tensorflow/lite/micro/micro_context.cpp
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/tensorflow/lite/micro/micro_interpreter.cpp
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/tensorflow/lite/micro/micro_interpreter_context.cpp
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/tensorflow/lite/micro/micro_interpreter_graph.cpp
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/tensorflow/lite/micro/micro_log.cpp
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/tensorflow/lite/micro/micro_op_resolver.cpp
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/tensorflow/lite/micro/micro_profiler.cpp
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/tensorflow/lite/micro/micro_resource_variable.cpp
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/tensorflow/lite/micro/micro_time.cpp
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/tensorflow/lite/micro/micro_utils.cpp
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/tensorflow/lite/micro/mock_micro_graph.cpp
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/tensorflow/lite/micro/recording_micro_allocator.cpp
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/tensorflow/lite/micro/system_setup.cpp
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/tensorflow/lite/micro/test_helper_custom_ops.cpp
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/tensorflow/lite/micro/test_helpers.cpp
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/tensorflow/lite/micro/kernels/activations_common.cpp
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/tensorflow/lite/micro/kernels/add_common.cpp
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/tensorflow/lite/micro/kernels/add_n.cpp
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/tensorflow/lite/micro/kernels/arg_min_max.cpp
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/tensorflow/lite/micro/kernels/assign_variable.cpp
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/tensorflow/lite/micro/kernels/batch_matmul.cpp
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/tensorflow/lite/micro/kernels/batch_to_space_nd.cpp
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/tensorflow/lite/micro/kernels/broadcast_args.cpp
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/tensorflow/lite/micro/kernels/broadcast_to.cpp
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/tensorflow/lite/micro/kernels/call_once.cpp
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/tensorflow/lite/micro/kernels/cast.cpp
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/tensorflow/lite/micro/kernels/ceil.cpp
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/tensorflow/lite/micro/kernels/circular_buffer.cpp
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/tensorflow/lite/micro/kernels/circular_buffer_common.cpp
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/tensorflow/lite/micro/kernels/comparisons.cpp
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/tensorflow/lite/micro/kernels/concatenation.cpp
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/tensorflow/lite/micro/kernels/conv_common.cpp
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/tensorflow/lite/micro/kernels/cumsum.cpp
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/tensorflow/lite/micro/kernels/depth_to_space.cpp
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/tensorflow/lite/micro/kernels/depthwise_conv_common.cpp
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/tensorflow/lite/micro/kernels/dequantize.cpp
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/tensorflow/lite/micro/kernels/dequantize_common.cpp
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/tensorflow/lite/micro/kernels/detection_postprocess.cpp
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/tensorflow/lite/micro/kernels/div.cpp
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/tensorflow/lite/micro/kernels/elementwise.cpp
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/tensorflow/lite/micro/kernels/elu.cpp
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/tensorflow/lite/micro/kernels/embedding_lookup.cpp
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/tensorflow/lite/micro/kernels/exp.cpp
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/tensorflow/lite/micro/kernels/expand_dims.cpp
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/tensorflow/lite/micro/kernels/fill.cpp
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/tensorflow/lite/micro/kernels/floor_div.cpp
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/tensorflow/lite/micro/kernels/floor_mod.cpp
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/tensorflow/lite/micro/kernels/fully_connected_common.cpp
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/tensorflow/lite/micro/kernels/gather.cpp
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/tensorflow/lite/micro/kernels/gather_nd.cpp
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/tensorflow/lite/micro/kernels/hard_swish.cpp
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/tensorflow/lite/micro/kernels/hard_swish_common.cpp
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/tensorflow/lite/micro/kernels/if.cpp
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/tensorflow/lite/micro/kernels/kernel_util.cpp
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/tensorflow/lite/micro/kernels/l2_pool_2d.cpp
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/tensorflow/lite/micro/kernels/l2norm.cpp
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/tensorflow/lite/micro/kernels/leaky_relu_common.cpp
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/tensorflow/lite/micro/kernels/log_softmax.cpp
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/tensorflow/lite/micro/kernels/logical.cpp
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/tensorflow/lite/micro/kernels/logical_common.cpp
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/tensorflow/lite/micro/kernels/logistic_common.cpp
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/tensorflow/lite/micro/kernels/lstm_eval_common.cpp
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/tensorflow/lite/micro/kernels/maximum_minimum.cpp
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/tensorflow/lite/micro/kernels/micro_tensor_utils.cpp
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/tensorflow/lite/micro/kernels/mirror_pad.cpp
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/tensorflow/lite/micro/kernels/mul_common.cpp
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/tensorflow/lite/micro/kernels/neg.cpp
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/tensorflow/lite/micro/kernels/pack.cpp
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/tensorflow/lite/micro/kernels/pooling_common.cpp
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/tensorflow/lite/micro/kernels/prelu.cpp
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/tensorflow/lite/micro/kernels/prelu_common.cpp
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/tensorflow/lite/micro/kernels/quantize_common.cpp
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/tensorflow/lite/micro/kernels/read_variable.cpp
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/tensorflow/lite/micro/kernels/reduce_common.cpp
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/tensorflow/lite/micro/kernels/reshape_common.cpp
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/tensorflow/lite/micro/kernels/resize_bilinear.cpp
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/tensorflow/lite/micro/kernels/resize_nearest_neighbor.cpp
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/tensorflow/lite/micro/kernels/round.cpp
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/tensorflow/lite/micro/kernels/select.cpp
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/tensorflow/lite/micro/kernels/shape.cpp
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/tensorflow/lite/micro/kernels/slice.cpp
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/tensorflow/lite/micro/kernels/strided_slice_common.cpp
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/tensorflow/lite/micro/kernels/softmax_common.cpp
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/tensorflow/lite/micro/kernels/space_to_batch_nd.cpp
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/tensorflow/lite/micro/kernels/space_to_depth.cpp
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/tensorflow/lite/micro/kernels/split.cpp
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/tensorflow/lite/micro/kernels/split_v.cpp
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/tensorflow/lite/micro/kernels/squared_difference.cpp
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/tensorflow/lite/micro/kernels/squeeze.cpp
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/tensorflow/lite/micro/kernels/sub_common.cpp
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/tensorflow/lite/micro/kernels/svdf_common.cpp
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/tensorflow/lite/micro/kernels/tanh.cpp
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/tensorflow/lite/micro/kernels/transpose.cpp
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/tensorflow/lite/micro/kernels/unpack.cpp
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/tensorflow/lite/micro/kernels/var_handle.cpp
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/tensorflow/lite/micro/kernels/while.cpp
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/tensorflow/lite/micro/kernels/zeros_like.cpp
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/tensorflow/lite/micro/arena_allocator/non_persistent_arena_buffer_allocator.cpp
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/tensorflow/lite/micro/arena_allocator/persistent_arena_buffer_allocator.cpp
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/tensorflow/lite/micro/arena_allocator/recording_single_arena_buffer_allocator.cpp
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/tensorflow/lite/micro/arena_allocator/single_arena_buffer_allocator.cpp
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/tensorflow/lite/micro/memory_planner/greedy_memory_planner.cpp
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/tensorflow/lite/micro/memory_planner/linear_memory_planner.cpp
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/tensorflow/lite/micro/memory_planner/non_persistent_buffer_planner_shim.cpp
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/tensorflow/lite/micro/tflite_bridge/flatbuffer_conversions_bridge.cpp
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/tensorflow/lite/micro/tflite_bridge/micro_error_reporter.cpp
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/tensorflow/lite/schema/schema_utils.cpp
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/.
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/kissfft
)

else()

message(SEND_ERROR "middleware_eiq_tensorflow_lite_micro dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_middleware_eiq_tensorflow_lite_micro_binary)
# Add set(CONFIG_USE_middleware_eiq_tensorflow_lite_micro_binary true) in config.cmake to use this component

message("middleware_eiq_tensorflow_lite_micro_binary component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if(CONFIG_USE_middleware_eiq_tensorflow_lite_micro_headers)

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/tensorflow/lite/micro/debug_log.cpp
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/.
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/flatbuffers/include
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/gemmlowp
)

if((CONFIG_TOOLCHAIN STREQUAL armgcc OR CONFIG_TOOLCHAIN STREQUAL mcux) AND CONFIG_CORE STREQUAL cm4f)
  target_link_libraries(${MCUX_SDK_PROJECT_NAME} PRIVATE
    -Wl,--start-group
      ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/lib/cm4/armgcc/libtflm.a
      -Wl,--end-group
  )
endif()

if((CONFIG_TOOLCHAIN STREQUAL armgcc OR CONFIG_TOOLCHAIN STREQUAL mcux) AND CONFIG_CORE STREQUAL cm7f)
  target_link_libraries(${MCUX_SDK_PROJECT_NAME} PRIVATE
    -Wl,--start-group
      ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/lib/cm7/armgcc/libtflm.a
      -Wl,--end-group
  )
endif()

if((CONFIG_TOOLCHAIN STREQUAL armgcc OR CONFIG_TOOLCHAIN STREQUAL mcux) AND CONFIG_CORE STREQUAL cm33)
  target_link_libraries(${MCUX_SDK_PROJECT_NAME} PRIVATE
    -Wl,--start-group
      ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/lib/cm33/armgcc/libtflm.a
      -Wl,--end-group
  )
endif()

else()

message(SEND_ERROR "middleware_eiq_tensorflow_lite_micro_binary dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_middleware_eiq_tensorflow_lite_micro_cmsis_nn)
# Add set(CONFIG_USE_middleware_eiq_tensorflow_lite_micro_cmsis_nn true) in config.cmake to use this component

message("middleware_eiq_tensorflow_lite_micro_cmsis_nn component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if(CONFIG_USE_middleware_eiq_tensorflow_lite_micro AND (CONFIG_CORE STREQUAL cm4f OR CONFIG_CORE STREQUAL cm33 OR CONFIG_CORE STREQUAL cm7f) AND CONFIG_USE_middleware_eiq_tensorflow_lite_micro_third_party_cmsis_nn)

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/tensorflow/lite/micro/kernels/cmsis_nn/add.cpp
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/tensorflow/lite/micro/kernels/cmsis_nn/conv.cpp
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/tensorflow/lite/micro/kernels/cmsis_nn/depthwise_conv.cpp
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/tensorflow/lite/micro/kernels/cmsis_nn/fully_connected.cpp
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/tensorflow/lite/micro/kernels/cmsis_nn/mul.cpp
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/tensorflow/lite/micro/kernels/cmsis_nn/pooling.cpp
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/tensorflow/lite/micro/kernels/cmsis_nn/softmax.cpp
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/tensorflow/lite/micro/kernels/cmsis_nn/svdf.cpp
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/tensorflow/lite/micro/kernels/cmsis_nn/unidirectional_sequence_lstm.cpp
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/tensorflow/lite/micro/kernels/activations.cpp
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/tensorflow/lite/micro/kernels/ethosu.cpp
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/tensorflow/lite/micro/kernels/floor.cpp
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/tensorflow/lite/micro/kernels/leaky_relu.cpp
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/tensorflow/lite/micro/kernels/logistic.cpp
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/tensorflow/lite/micro/kernels/lstm_eval.cpp
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/tensorflow/lite/micro/kernels/pad.cpp
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/tensorflow/lite/micro/kernels/quantize.cpp
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/tensorflow/lite/micro/kernels/reduce.cpp
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/tensorflow/lite/micro/kernels/reshape.cpp
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/tensorflow/lite/micro/kernels/strided_slice.cpp
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/tensorflow/lite/micro/kernels/sub.cpp
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/tensorflow/lite/micro/kernels/transpose_conv.cpp
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/.
)

if(CONFIG_USE_COMPONENT_CONFIGURATION)
  message("===>Import configuration from ${CMAKE_CURRENT_LIST_FILE}")

  target_compile_definitions(${MCUX_SDK_PROJECT_NAME} PUBLIC
    -DCMSIS_NN
  )

endif()

else()

message(SEND_ERROR "middleware_eiq_tensorflow_lite_micro_cmsis_nn dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_middleware_eiq_tensorflow_lite_micro_cmsis_nn_ethosu)
# Add set(CONFIG_USE_middleware_eiq_tensorflow_lite_micro_cmsis_nn_ethosu true) in config.cmake to use this component

message("middleware_eiq_tensorflow_lite_micro_cmsis_nn_ethosu component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if(CONFIG_USE_middleware_eiq_tensorflow_lite_micro AND (CONFIG_CORE STREQUAL cm4f OR CONFIG_CORE STREQUAL cm33 OR CONFIG_CORE STREQUAL cm7f) AND CONFIG_USE_middleware_eiq_tensorflow_lite_micro_third_party_cmsis_nn)

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/tensorflow/lite/micro/debug_log.cpp
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/tensorflow/lite/micro/kernels/cmsis_nn/add.cpp
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/tensorflow/lite/micro/kernels/cmsis_nn/conv.cpp
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/tensorflow/lite/micro/kernels/cmsis_nn/depthwise_conv.cpp
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/tensorflow/lite/micro/kernels/cmsis_nn/fully_connected.cpp
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/tensorflow/lite/micro/kernels/cmsis_nn/mul.cpp
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/tensorflow/lite/micro/kernels/cmsis_nn/pooling.cpp
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/tensorflow/lite/micro/kernels/cmsis_nn/softmax.cpp
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/tensorflow/lite/micro/kernels/cmsis_nn/svdf.cpp
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/tensorflow/lite/micro/kernels/cmsis_nn/unidirectional_sequence_lstm.cpp
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/tensorflow/lite/micro/kernels/activations.cpp
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/tensorflow/lite/micro/kernels/ethos_u/ethosu.cpp
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/tensorflow/lite/micro/kernels/floor.cpp
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/tensorflow/lite/micro/kernels/leaky_relu.cpp
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/tensorflow/lite/micro/kernels/logistic.cpp
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/tensorflow/lite/micro/kernels/lstm_eval.cpp
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/tensorflow/lite/micro/kernels/pad.cpp
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/tensorflow/lite/micro/kernels/quantize.cpp
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/tensorflow/lite/micro/kernels/reduce.cpp
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/tensorflow/lite/micro/kernels/reshape.cpp
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/tensorflow/lite/micro/kernels/strided_slice.cpp
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/tensorflow/lite/micro/kernels/sub.cpp
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/tensorflow/lite/micro/kernels/transpose_conv.cpp
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/.
)

if(CONFIG_USE_COMPONENT_CONFIGURATION)
  message("===>Import configuration from ${CMAKE_CURRENT_LIST_FILE}")

  target_compile_definitions(${MCUX_SDK_PROJECT_NAME} PUBLIC
    -DCMSIS_NN
  )

endif()

else()

message(SEND_ERROR "middleware_eiq_tensorflow_lite_micro_cmsis_nn_ethosu dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_middleware_eiq_tensorflow_lite_micro_examples_microspeech)
# Add set(CONFIG_USE_middleware_eiq_tensorflow_lite_micro_examples_microspeech true) in config.cmake to use this component

message("middleware_eiq_tensorflow_lite_micro_examples_microspeech component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if(CONFIG_USE_middleware_eiq_tensorflow_lite_micro_third_party_kissfft)

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/tensorflow/lite/micro/examples/micro_speech/audio_provider.cpp
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/tensorflow/lite/micro/examples/micro_speech/command_responder.cpp
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/tensorflow/lite/micro/examples/micro_speech/feature_provider.cpp
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/tensorflow/lite/micro/examples/micro_speech/recognize_commands.cpp
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/tensorflow/lite/micro/examples/micro_speech/micro_features/micro_features_generator.cpp
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/tensorflow/lite/micro/examples/micro_speech/micro_features/micro_model_settings.cpp
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/tensorflow/lite/experimental/microfrontend/lib/filterbank.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/tensorflow/lite/experimental/microfrontend/lib/filterbank_util.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/tensorflow/lite/experimental/microfrontend/lib/frontend.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/tensorflow/lite/experimental/microfrontend/lib/frontend_util.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/tensorflow/lite/experimental/microfrontend/lib/log_lut.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/tensorflow/lite/experimental/microfrontend/lib/log_scale.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/tensorflow/lite/experimental/microfrontend/lib/log_scale_util.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/tensorflow/lite/experimental/microfrontend/lib/noise_reduction.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/tensorflow/lite/experimental/microfrontend/lib/noise_reduction_util.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/tensorflow/lite/experimental/microfrontend/lib/pcan_gain_control.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/tensorflow/lite/experimental/microfrontend/lib/pcan_gain_control_util.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/tensorflow/lite/experimental/microfrontend/lib/window.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/tensorflow/lite/experimental/microfrontend/lib/window_util.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/tensorflow/lite/experimental/microfrontend/lib/fft.cpp
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/tensorflow/lite/experimental/microfrontend/lib/fft_util.cpp
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/tensorflow/lite/experimental/microfrontend/lib/kiss_fft_int16.cpp
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/.
)

else()

message(SEND_ERROR "middleware_eiq_tensorflow_lite_micro_examples_microspeech dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_middleware_eiq_tensorflow_lite_micro_headers)
# Add set(CONFIG_USE_middleware_eiq_tensorflow_lite_micro_headers true) in config.cmake to use this component

message("middleware_eiq_tensorflow_lite_micro_headers component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if(CONFIG_USE_middleware_eiq_tensorflow_lite_micro_third_party_flatbuffers AND CONFIG_USE_middleware_eiq_tensorflow_lite_micro_third_party_gemmlowp AND CONFIG_USE_middleware_eiq_tensorflow_lite_micro_third_party_ruy)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/.
)

else()

message(SEND_ERROR "middleware_eiq_tensorflow_lite_micro_headers dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_middleware_eiq_tensorflow_lite_micro_reference)
# Add set(CONFIG_USE_middleware_eiq_tensorflow_lite_micro_reference true) in config.cmake to use this component

message("middleware_eiq_tensorflow_lite_micro_reference component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if(CONFIG_USE_middleware_eiq_tensorflow_lite_micro)

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/tensorflow/lite/micro/kernels/activations.cpp
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/tensorflow/lite/micro/kernels/add.cpp
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/tensorflow/lite/micro/kernels/conv.cpp
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/tensorflow/lite/micro/kernels/depthwise_conv.cpp
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/tensorflow/lite/micro/kernels/floor.cpp
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/tensorflow/lite/micro/kernels/fully_connected.cpp
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/tensorflow/lite/micro/kernels/leaky_relu.cpp
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/tensorflow/lite/micro/kernels/logistic.cpp
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/tensorflow/lite/micro/kernels/lstm_eval.cpp
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/tensorflow/lite/micro/kernels/mul.cpp
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/tensorflow/lite/micro/kernels/pad.cpp
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/tensorflow/lite/micro/kernels/pooling.cpp
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/tensorflow/lite/micro/kernels/quantize.cpp
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/tensorflow/lite/micro/kernels/reduce.cpp
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/tensorflow/lite/micro/kernels/reshape.cpp
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/tensorflow/lite/micro/kernels/svdf.cpp
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/tensorflow/lite/micro/kernels/softmax.cpp
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/tensorflow/lite/micro/kernels/strided_slice.cpp
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/tensorflow/lite/micro/kernels/sub.cpp
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/tensorflow/lite/micro/kernels/transpose_conv.cpp
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/tensorflow/lite/micro/kernels/unidirectional_sequence_lstm.cpp
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/.
)

else()

message(SEND_ERROR "middleware_eiq_tensorflow_lite_micro_reference dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_middleware_eiq_tensorflow_lite_micro_third_party_cmsis_nn)
# Add set(CONFIG_USE_middleware_eiq_tensorflow_lite_micro_third_party_cmsis_nn true) in config.cmake to use this component

message("middleware_eiq_tensorflow_lite_micro_third_party_cmsis_nn component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if(CONFIG_USE_CMSIS_Include_core_cm)

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/cmsis_nn/Source/ActivationFunctions/arm_nn_activation_s16.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/cmsis_nn/Source/ActivationFunctions/arm_relu6_s8.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/cmsis_nn/Source/ActivationFunctions/arm_relu_q15.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/cmsis_nn/Source/ActivationFunctions/arm_relu_q7.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/cmsis_nn/Source/BasicMathFunctions/arm_elementwise_add_s16.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/cmsis_nn/Source/BasicMathFunctions/arm_elementwise_add_s8.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/cmsis_nn/Source/BasicMathFunctions/arm_elementwise_mul_s16.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/cmsis_nn/Source/BasicMathFunctions/arm_elementwise_mul_s16_s8.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/cmsis_nn/Source/BasicMathFunctions/arm_elementwise_mul_s8.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/cmsis_nn/Source/ConcatenationFunctions/arm_concatenation_s8_w.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/cmsis_nn/Source/ConcatenationFunctions/arm_concatenation_s8_x.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/cmsis_nn/Source/ConcatenationFunctions/arm_concatenation_s8_y.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/cmsis_nn/Source/ConcatenationFunctions/arm_concatenation_s8_z.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/cmsis_nn/Source/ConvolutionFunctions/arm_convolve_1_x_n_s8.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/cmsis_nn/Source/ConvolutionFunctions/arm_convolve_1x1_s8.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/cmsis_nn/Source/ConvolutionFunctions/arm_convolve_1x1_s8_fast.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/cmsis_nn/Source/ConvolutionFunctions/arm_convolve_fast_s16.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/cmsis_nn/Source/ConvolutionFunctions/arm_convolve_get_buffer_sizes_s16.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/cmsis_nn/Source/ConvolutionFunctions/arm_convolve_get_buffer_sizes_s8.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/cmsis_nn/Source/ConvolutionFunctions/arm_convolve_s16.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/cmsis_nn/Source/ConvolutionFunctions/arm_convolve_s8.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/cmsis_nn/Source/ConvolutionFunctions/arm_convolve_wrapper_s16.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/cmsis_nn/Source/ConvolutionFunctions/arm_convolve_wrapper_s8.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/cmsis_nn/Source/ConvolutionFunctions/arm_depthwise_conv_3x3_s8.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/cmsis_nn/Source/ConvolutionFunctions/arm_depthwise_conv_fast_s16.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/cmsis_nn/Source/ConvolutionFunctions/arm_depthwise_conv_get_buffer_sizes_s16.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/cmsis_nn/Source/ConvolutionFunctions/arm_depthwise_conv_get_buffer_sizes_s8.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/cmsis_nn/Source/ConvolutionFunctions/arm_depthwise_conv_s16.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/cmsis_nn/Source/ConvolutionFunctions/arm_depthwise_conv_s8.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/cmsis_nn/Source/ConvolutionFunctions/arm_depthwise_conv_s8_opt.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/cmsis_nn/Source/ConvolutionFunctions/arm_depthwise_conv_wrapper_s16.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/cmsis_nn/Source/ConvolutionFunctions/arm_depthwise_conv_wrapper_s8.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/cmsis_nn/Source/ConvolutionFunctions/arm_nn_depthwise_conv_s8_core.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/cmsis_nn/Source/ConvolutionFunctions/arm_nn_mat_mult_kernel_s8_s16.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/cmsis_nn/Source/ConvolutionFunctions/arm_nn_mat_mult_s8.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/cmsis_nn/Source/FullyConnectedFunctions/arm_fully_connected_get_buffer_sizes_s16.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/cmsis_nn/Source/FullyConnectedFunctions/arm_fully_connected_get_buffer_sizes_s8.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/cmsis_nn/Source/FullyConnectedFunctions/arm_fully_connected_s16.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/cmsis_nn/Source/FullyConnectedFunctions/arm_fully_connected_s8.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/cmsis_nn/Source/LSTMFunctions/arm_lstm_unidirectional_s8_s16.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/cmsis_nn/Source/NNSupportFunctions/arm_nn_depthwise_conv_nt_t_padded_s8.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/cmsis_nn/Source/NNSupportFunctions/arm_nn_depthwise_conv_nt_t_s16.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/cmsis_nn/Source/NNSupportFunctions/arm_nn_depthwise_conv_nt_t_s8.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/cmsis_nn/Source/NNSupportFunctions/arm_nn_lstm_calculate_gate_s8_s16.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/cmsis_nn/Source/NNSupportFunctions/arm_nn_lstm_step_s8_s16.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/cmsis_nn/Source/NNSupportFunctions/arm_nn_lstm_update_cell_state_s16.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/cmsis_nn/Source/NNSupportFunctions/arm_nn_lstm_update_output_s8_s16.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/cmsis_nn/Source/NNSupportFunctions/arm_nn_mat_mul_core_1x_s8.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/cmsis_nn/Source/NNSupportFunctions/arm_nn_mat_mul_core_4x_s8.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/cmsis_nn/Source/NNSupportFunctions/arm_nn_mat_mul_kernel_s16.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/cmsis_nn/Source/NNSupportFunctions/arm_nn_mat_mult_nt_t_s8.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/cmsis_nn/Source/NNSupportFunctions/arm_nn_vec_mat_mul_result_acc_s8.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/cmsis_nn/Source/NNSupportFunctions/arm_nn_vec_mat_mult_t_s16.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/cmsis_nn/Source/NNSupportFunctions/arm_nn_vec_mat_mult_t_s8.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/cmsis_nn/Source/NNSupportFunctions/arm_nn_vec_mat_mult_t_svdf_s8.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/cmsis_nn/Source/NNSupportFunctions/arm_nntables.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/cmsis_nn/Source/NNSupportFunctions/arm_q7_to_q15_with_offset.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/cmsis_nn/Source/NNSupportFunctions/arm_s8_to_s16_unordered_with_offset.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/cmsis_nn/Source/PoolingFunctions/arm_avgpool_get_buffer_sizes_s16.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/cmsis_nn/Source/PoolingFunctions/arm_avgpool_get_buffer_sizes_s8.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/cmsis_nn/Source/PoolingFunctions/arm_avgpool_s16.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/cmsis_nn/Source/PoolingFunctions/arm_avgpool_s8.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/cmsis_nn/Source/PoolingFunctions/arm_max_pool_s16.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/cmsis_nn/Source/PoolingFunctions/arm_max_pool_s8.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/cmsis_nn/Source/ReshapeFunctions/arm_reshape_s8.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/cmsis_nn/Source/SVDFunctions/arm_svdf_s8.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/cmsis_nn/Source/SVDFunctions/arm_svdf_state_s16_s8.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/cmsis_nn/Source/SoftmaxFunctions/arm_nn_softmax_common_s8.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/cmsis_nn/Source/SoftmaxFunctions/arm_softmax_s16.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/cmsis_nn/Source/SoftmaxFunctions/arm_softmax_s8.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/cmsis_nn/Source/SoftmaxFunctions/arm_softmax_s8_s16.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/cmsis_nn/Source/SoftmaxFunctions/arm_softmax_u8.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/cmsis_nn/.
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/cmsis_nn/Include
)

else()

message(SEND_ERROR "middleware_eiq_tensorflow_lite_micro_third_party_cmsis_nn dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_middleware_eiq_tensorflow_lite_micro_third_party_kissfft)
# Add set(CONFIG_USE_middleware_eiq_tensorflow_lite_micro_third_party_kissfft true) in config.cmake to use this component

message("middleware_eiq_tensorflow_lite_micro_third_party_kissfft component is included from ${CMAKE_CURRENT_LIST_FILE}.")

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/kissfft/kiss_fft.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/kissfft/tools/kfc.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/kissfft/tools/kiss_fastfir.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/kissfft/tools/kiss_fftnd.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/kissfft/tools/kiss_fftndr.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/kissfft/tools/kiss_fftr.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/kissfft/.
)


endif()


if (CONFIG_USE_middleware_eiq_tensorflow_lite_micro_third_party_xa_nnlib_hifi4)
# Add set(CONFIG_USE_middleware_eiq_tensorflow_lite_micro_third_party_xa_nnlib_hifi4 true) in config.cmake to use this component

message("middleware_eiq_tensorflow_lite_micro_third_party_xa_nnlib_hifi4 component is included from ${CMAKE_CURRENT_LIST_FILE}.")

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/xa_nnlib_hifi4/algo/common/src/xa_nnlib_common_api.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/xa_nnlib_hifi4/algo/kernels/activations/hifi4/xa_nn_activations_16_16.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/xa_nnlib_hifi4/algo/kernels/activations/hifi4/xa_nn_activations_32_16.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/xa_nnlib_hifi4/algo/kernels/activations/hifi4/xa_nn_activations_32_32.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/xa_nnlib_hifi4/algo/kernels/activations/hifi4/xa_nn_activations_32_8.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/xa_nnlib_hifi4/algo/kernels/activations/hifi4/xa_nn_activations_8_8.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/xa_nnlib_hifi4/algo/kernels/activations/hifi4/xa_nn_activations_asym16_asym16.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/xa_nnlib_hifi4/algo/kernels/activations/hifi4/xa_nn_activations_asym8_asym8.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/xa_nnlib_hifi4/algo/kernels/activations/hifi4/xa_nn_activations_f32_f32.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/xa_nnlib_hifi4/algo/kernels/activations/hifi4/xa_nn_softmax_asym8_asym8.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/xa_nnlib_hifi4/algo/kernels/basic/hifi4/xa_nn_broadcast_8_8.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/xa_nnlib_hifi4/algo/kernels/basic/hifi4/xa_nn_dot_prod_16x16.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/xa_nnlib_hifi4/algo/kernels/basic/hifi4/xa_nn_elm_abs_f32.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/xa_nnlib_hifi4/algo/kernels/basic/hifi4/xa_nn_elm_add_f32.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/xa_nnlib_hifi4/algo/kernels/basic/hifi4/xa_nn_elm_add_quant16.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/xa_nnlib_hifi4/algo/kernels/basic/hifi4/xa_nn_elm_add_quant8.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/xa_nnlib_hifi4/algo/kernels/basic/hifi4/xa_nn_elm_ceil_f32.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/xa_nnlib_hifi4/algo/kernels/basic/hifi4/xa_nn_elm_compare_quant8.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/xa_nnlib_hifi4/algo/kernels/basic/hifi4/xa_nn_elm_cosine_f32.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/xa_nnlib_hifi4/algo/kernels/basic/hifi4/xa_nn_elm_div_f32.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/xa_nnlib_hifi4/algo/kernels/basic/hifi4/xa_nn_elm_logical_bool.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/xa_nnlib_hifi4/algo/kernels/basic/hifi4/xa_nn_elm_logn_f32.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/xa_nnlib_hifi4/algo/kernels/basic/hifi4/xa_nn_elm_minmax_8.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/xa_nnlib_hifi4/algo/kernels/basic/hifi4/xa_nn_elm_mul_16x16.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/xa_nnlib_hifi4/algo/kernels/basic/hifi4/xa_nn_elm_mul_acc_f32.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/xa_nnlib_hifi4/algo/kernels/basic/hifi4/xa_nn_elm_mul_f32.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/xa_nnlib_hifi4/algo/kernels/basic/hifi4/xa_nn_elm_mul_quant8.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/xa_nnlib_hifi4/algo/kernels/basic/hifi4/xa_nn_elm_neg_f32.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/xa_nnlib_hifi4/algo/kernels/basic/hifi4/xa_nn_elm_quantize.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/xa_nnlib_hifi4/algo/kernels/basic/hifi4/xa_nn_elm_round_f32.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/xa_nnlib_hifi4/algo/kernels/basic/hifi4/xa_nn_elm_rsqrt_f32.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/xa_nnlib_hifi4/algo/kernels/basic/hifi4/xa_nn_elm_sine_f32.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/xa_nnlib_hifi4/algo/kernels/basic/hifi4/xa_nn_elm_sqrt_f32.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/xa_nnlib_hifi4/algo/kernels/basic/hifi4/xa_nn_elm_square_f32.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/xa_nnlib_hifi4/algo/kernels/basic/hifi4/xa_nn_elm_squared_diff_quant8.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/xa_nnlib_hifi4/algo/kernels/basic/hifi4/xa_nn_elm_sub_f32.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/xa_nnlib_hifi4/algo/kernels/basic/hifi4/xa_nn_elm_sub_quant16.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/xa_nnlib_hifi4/algo/kernels/basic/hifi4/xa_nn_elm_sub_quant8.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/xa_nnlib_hifi4/algo/kernels/basic/hifi4/xa_nn_floor_f32.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/xa_nnlib_hifi4/algo/kernels/basic/hifi4/xa_nn_memmove.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/xa_nnlib_hifi4/algo/kernels/basic/hifi4/xa_nn_memmove_16.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/xa_nnlib_hifi4/algo/kernels/basic/hifi4/xa_nn_memset_f32.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/xa_nnlib_hifi4/algo/kernels/basic/hifi4/xa_nn_reduce_asym8s_asym8s.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/xa_nnlib_hifi4/algo/kernels/basic/hifi4/xa_nn_vec_interpolation_q15.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/xa_nnlib_hifi4/algo/kernels/cnn/hifi4/xa_nn_circ_buf.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/xa_nnlib_hifi4/algo/kernels/cnn/hifi4/xa_nn_conv1d_std_16x16.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/xa_nnlib_hifi4/algo/kernels/cnn/hifi4/xa_nn_conv1d_std_8x16.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/xa_nnlib_hifi4/algo/kernels/cnn/hifi4/xa_nn_conv1d_std_8x8.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/xa_nnlib_hifi4/algo/kernels/cnn/hifi4/xa_nn_conv1d_std_asym8xasym8.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/xa_nnlib_hifi4/algo/kernels/cnn/hifi4/xa_nn_conv1d_std_circ_buf.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/xa_nnlib_hifi4/algo/kernels/cnn/hifi4/xa_nn_conv1d_std_f32.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/xa_nnlib_hifi4/algo/kernels/cnn/hifi4/xa_nn_conv2d_depthwise.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/xa_nnlib_hifi4/algo/kernels/cnn/hifi4/xa_nn_conv2d_depthwise_16x16.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/xa_nnlib_hifi4/algo/kernels/cnn/hifi4/xa_nn_conv2d_depthwise_8x16.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/xa_nnlib_hifi4/algo/kernels/cnn/hifi4/xa_nn_conv2d_depthwise_8x8.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/xa_nnlib_hifi4/algo/kernels/cnn/hifi4/xa_nn_conv2d_depthwise_asym8xasym8.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/xa_nnlib_hifi4/algo/kernels/cnn/hifi4/xa_nn_conv2d_depthwise_f32.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/xa_nnlib_hifi4/algo/kernels/cnn/hifi4/xa_nn_conv2d_depthwise_sym8sxasym8s.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/xa_nnlib_hifi4/algo/kernels/cnn/hifi4/xa_nn_conv2d_depthwise_sym8sxsym16s.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/xa_nnlib_hifi4/algo/kernels/cnn/hifi4/xa_nn_conv2d_pointwise_16x16.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/xa_nnlib_hifi4/algo/kernels/cnn/hifi4/xa_nn_conv2d_pointwise_8x16.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/xa_nnlib_hifi4/algo/kernels/cnn/hifi4/xa_nn_conv2d_pointwise_8x8.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/xa_nnlib_hifi4/algo/kernels/cnn/hifi4/xa_nn_conv2d_pointwise_asym8xasym8.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/xa_nnlib_hifi4/algo/kernels/cnn/hifi4/xa_nn_conv2d_pointwise_f32.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/xa_nnlib_hifi4/algo/kernels/cnn/hifi4/xa_nn_conv2d_pointwise_sym8sxasym8s.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/xa_nnlib_hifi4/algo/kernels/cnn/hifi4/xa_nn_conv2d_pointwise_sym8sxsym16s.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/xa_nnlib_hifi4/algo/kernels/cnn/hifi4/xa_nn_conv2d_std_16x16.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/xa_nnlib_hifi4/algo/kernels/cnn/hifi4/xa_nn_conv2d_std_8x16.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/xa_nnlib_hifi4/algo/kernels/cnn/hifi4/xa_nn_conv2d_std_8x8.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/xa_nnlib_hifi4/algo/kernels/cnn/hifi4/xa_nn_conv2d_std_asym8xasym8.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/xa_nnlib_hifi4/algo/kernels/cnn/hifi4/xa_nn_conv2d_std_circ_buf.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/xa_nnlib_hifi4/algo/kernels/cnn/hifi4/xa_nn_conv2d_std_f32.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/xa_nnlib_hifi4/algo/kernels/cnn/hifi4/xa_nn_conv2d_std_sym8sxasym8s.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/xa_nnlib_hifi4/algo/kernels/cnn/hifi4/xa_nn_conv2d_std_sym8sxsym16s.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/xa_nnlib_hifi4/algo/kernels/cnn/hifi4/xa_nn_matXvec_16x16_16_circ.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/xa_nnlib_hifi4/algo/kernels/cnn/hifi4/xa_nn_matXvec_16x16_16_circ_nb.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/xa_nnlib_hifi4/algo/kernels/cnn/hifi4/xa_nn_matXvec_8x16_16_circ.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/xa_nnlib_hifi4/algo/kernels/cnn/hifi4/xa_nn_matXvec_8x16_16_circ_nb.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/xa_nnlib_hifi4/algo/kernels/cnn/hifi4/xa_nn_matXvec_8x8_8_circ.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/xa_nnlib_hifi4/algo/kernels/cnn/hifi4/xa_nn_matXvec_8x8_8_circ_nb.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/xa_nnlib_hifi4/algo/kernels/cnn/hifi4/xa_nn_matXvec_asym8xasym8_asym8_circ.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/xa_nnlib_hifi4/algo/kernels/cnn/hifi4/xa_nn_matXvec_asym8xasym8_asym8_circ_nb.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/xa_nnlib_hifi4/algo/kernels/cnn/hifi4/xa_nn_matXvec_f32_circ.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/xa_nnlib_hifi4/algo/kernels/cnn/hifi4/xa_nn_matXvec_f32_circ_nb.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/xa_nnlib_hifi4/algo/kernels/cnn/hifi4/xa_nn_matXvec_sym8sxasym8s_asym8s_circ.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/xa_nnlib_hifi4/algo/kernels/cnn/hifi4/xa_nn_matXvec_sym8sxsym16s_sym16s_circ.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/xa_nnlib_hifi4/algo/kernels/cnn/hifi4/xa_nn_transpose_conv_sym8sxsym16s.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/xa_nnlib_hifi4/algo/kernels/fc/hifi4/xa_nn_fully_connected.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/xa_nnlib_hifi4/algo/kernels/matXvec/hifi4/xa_nn_matXvec_16x16.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/xa_nnlib_hifi4/algo/kernels/matXvec/hifi4/xa_nn_matXvec_16x16_batch.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/xa_nnlib_hifi4/algo/kernels/matXvec/hifi4/xa_nn_matXvec_16x8.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/xa_nnlib_hifi4/algo/kernels/matXvec/hifi4/xa_nn_matXvec_8x16.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/xa_nnlib_hifi4/algo/kernels/matXvec/hifi4/xa_nn_matXvec_8x16_batch.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/xa_nnlib_hifi4/algo/kernels/matXvec/hifi4/xa_nn_matXvec_8x8.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/xa_nnlib_hifi4/algo/kernels/matXvec/hifi4/xa_nn_matXvec_8x8_batch.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/xa_nnlib_hifi4/algo/kernels/matXvec/hifi4/xa_nn_matXvec_asym8sxasym8s.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/xa_nnlib_hifi4/algo/kernels/matXvec/hifi4/xa_nn_matXvec_asym8xasym8.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/xa_nnlib_hifi4/algo/kernels/matXvec/hifi4/xa_nn_matXvec_asym8xasym8_batch.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/xa_nnlib_hifi4/algo/kernels/matXvec/hifi4/xa_nn_matXvec_f32.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/xa_nnlib_hifi4/algo/kernels/matXvec/hifi4/xa_nn_matXvec_f32_batch.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/xa_nnlib_hifi4/algo/kernels/matXvec/hifi4/xa_nn_matXvec_sym8sxasym8s.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/xa_nnlib_hifi4/algo/kernels/matXvec/hifi4/xa_nn_matXvec_sym8sxsym16s.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/xa_nnlib_hifi4/algo/kernels/matXvec/hifi4/xa_nn_matmul_16x16.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/xa_nnlib_hifi4/algo/kernels/matXvec/hifi4/xa_nn_matmul_8x16.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/xa_nnlib_hifi4/algo/kernels/matXvec/hifi4/xa_nn_matmul_8x8.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/xa_nnlib_hifi4/algo/kernels/matXvec/hifi4/xa_nn_matmul_asym8sxasym8s.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/xa_nnlib_hifi4/algo/kernels/matXvec/hifi4/xa_nn_matmul_asym8xasym8.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/xa_nnlib_hifi4/algo/kernels/matXvec/hifi4/xa_nn_matmul_f32.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/xa_nnlib_hifi4/algo/kernels/matXvec/hifi4/xa_nn_matmul_sym8sxasym8s.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/xa_nnlib_hifi4/algo/kernels/matXvec/hifi4/xa_nn_matmul_sym8sxsym16s.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/xa_nnlib_hifi4/algo/kernels/norm/hifi4/xa_nn_l2_norm_asym8s.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/xa_nnlib_hifi4/algo/kernels/norm/hifi4/xa_nn_l2_norm_f32.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/xa_nnlib_hifi4/algo/kernels/pool/hifi4/xa_nn_avgpool.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/xa_nnlib_hifi4/algo/kernels/pool/hifi4/xa_nn_avgpool_16.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/xa_nnlib_hifi4/algo/kernels/pool/hifi4/xa_nn_avgpool_16_nhwc.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/xa_nnlib_hifi4/algo/kernels/pool/hifi4/xa_nn_avgpool_8.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/xa_nnlib_hifi4/algo/kernels/pool/hifi4/xa_nn_avgpool_8_nhwc.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/xa_nnlib_hifi4/algo/kernels/pool/hifi4/xa_nn_avgpool_asym8.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/xa_nnlib_hifi4/algo/kernels/pool/hifi4/xa_nn_avgpool_asym8_nhwc.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/xa_nnlib_hifi4/algo/kernels/pool/hifi4/xa_nn_avgpool_f32.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/xa_nnlib_hifi4/algo/kernels/pool/hifi4/xa_nn_avgpool_f32_nhwc.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/xa_nnlib_hifi4/algo/kernels/pool/hifi4/xa_nn_inv_256_tbl.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/xa_nnlib_hifi4/algo/kernels/pool/hifi4/xa_nn_maxpool.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/xa_nnlib_hifi4/algo/kernels/pool/hifi4/xa_nn_maxpool_16.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/xa_nnlib_hifi4/algo/kernels/pool/hifi4/xa_nn_maxpool_16_nhwc.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/xa_nnlib_hifi4/algo/kernels/pool/hifi4/xa_nn_maxpool_8.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/xa_nnlib_hifi4/algo/kernels/pool/hifi4/xa_nn_maxpool_8_nhwc.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/xa_nnlib_hifi4/algo/kernels/pool/hifi4/xa_nn_maxpool_asym8.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/xa_nnlib_hifi4/algo/kernels/pool/hifi4/xa_nn_maxpool_asym8_nhwc.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/xa_nnlib_hifi4/algo/kernels/pool/hifi4/xa_nn_maxpool_f32.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/xa_nnlib_hifi4/algo/kernels/pool/hifi4/xa_nn_maxpool_f32_nhwc.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/xa_nnlib_hifi4/algo/kernels/reorg/hifi4/xa_nn_batch_to_space_nd_8.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/xa_nnlib_hifi4/algo/kernels/reorg/hifi4/xa_nn_depth_to_space_8.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/xa_nnlib_hifi4/algo/kernels/reorg/hifi4/xa_nn_pad_16.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/xa_nnlib_hifi4/algo/kernels/reorg/hifi4/xa_nn_pad_8.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/xa_nnlib_hifi4/algo/kernels/reorg/hifi4/xa_nn_space_to_batch_nd_8.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/xa_nnlib_hifi4/algo/kernels/reorg/hifi4/xa_nn_space_to_depth_8.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/xa_nnlib_hifi4/algo/kernels/reorg/hifi4/xa_nn_stride_slice_int16.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/xa_nnlib_hifi4/algo/kernels/reorg/hifi4/xa_nn_stride_slice_int8.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/xa_nnlib_hifi4/algo/ndsp/hifi4/src/expf_tbl.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/xa_nnlib_hifi4/algo/ndsp/hifi4/src/inff_tbl.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/xa_nnlib_hifi4/algo/ndsp/hifi4/src/inv2pif_tbl.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/xa_nnlib_hifi4/algo/ndsp/hifi4/src/lognf_tbl.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/xa_nnlib_hifi4/algo/ndsp/hifi4/src/nanf_tbl.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/xa_nnlib_hifi4/algo/ndsp/hifi4/src/pow2f_tbl.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/xa_nnlib_hifi4/algo/ndsp/hifi4/src/scl_sigmoidf_hifi4.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/xa_nnlib_hifi4/algo/ndsp/hifi4/src/scl_tanhf_hifi4.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/xa_nnlib_hifi4/algo/ndsp/hifi4/src/sinf_tbl.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/xa_nnlib_hifi4/algo/ndsp/hifi4/src/sqrt2f_tbl.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/xa_nnlib_hifi4/algo/ndsp/hifi4/src/tanhf_tbl.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/xa_nnlib_hifi4/algo/ndsp/hifi4/src/vec_alognf_hifi4.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/xa_nnlib_hifi4/algo/ndsp/hifi4/src/vec_cosinef_hifi4.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/xa_nnlib_hifi4/algo/ndsp/hifi4/src/vec_lognf_hifi4.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/xa_nnlib_hifi4/algo/ndsp/hifi4/src/vec_relu32x32_hifi4.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/xa_nnlib_hifi4/algo/ndsp/hifi4/src/vec_reluf_hifi4.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/xa_nnlib_hifi4/algo/ndsp/hifi4/src/vec_sigmoid32x32_hifi4.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/xa_nnlib_hifi4/algo/ndsp/hifi4/src/vec_sigmoidf_hifi4.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/xa_nnlib_hifi4/algo/ndsp/hifi4/src/vec_sinef_hifi4.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/xa_nnlib_hifi4/algo/ndsp/hifi4/src/vec_softmax32x32_hifi4.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/xa_nnlib_hifi4/algo/ndsp/hifi4/src/vec_softmaxf_hifi4.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/xa_nnlib_hifi4/algo/ndsp/hifi4/src/vec_tanh32x32_hifi4.c
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/xa_nnlib_hifi4/algo/ndsp/hifi4/src/vec_tanhf_hifi4.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/xa_nnlib_hifi4/.
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/xa_nnlib_hifi4/algo/common/include
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/xa_nnlib_hifi4/algo/kernels/basic/hifi4
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/xa_nnlib_hifi4/algo/kernels/cnn/hifi4
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/xa_nnlib_hifi4/algo/kernels/pool/hifi4
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/xa_nnlib_hifi4/algo/ndsp/hifi4/include
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/xa_nnlib_hifi4/include
  ${CMAKE_CURRENT_LIST_DIR}/tensorflow-lite/third_party/xa_nnlib_hifi4/include/nnlib
)

if(CONFIG_USE_COMPONENT_CONFIGURATION)
  message("===>Import configuration from ${CMAKE_CURRENT_LIST_FILE}")

  target_compile_definitions(${MCUX_SDK_PROJECT_NAME} PUBLIC
    -DNNLIB_V2
    -DMODEL_INT16
    -Dhifi4
  )

endif()


endif()

