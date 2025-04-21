# Ethos-U Core Software

## Content

[Introduction](#introduction)
[Directory structure](#directory-structure)
[Inference with Ethos-U example applications](#inference-with-ethos-u-example-applications)
[Test process](#test-process)
[Release notes](#release-notes)
[Limitations](#limitations)

## Introduction

Arm Ethos-U65 microNPU is integrated into i.MX93 applications processors, enabling developers to create more capable, cost-effective, and energy-efficient ML applications. It improves the inference performance of neural networks and is supported with an open-source driver and compiler. The NPU targets quantized Convolutional Neural Networks (CNN) and Recurrent Neural Networks (RNN).

This component is Ethos-U core software for Cortex-M core. It provides the example applications and core driver.

## Directory structure

```
<MCUXpresso-SDK-root>
|-- boards
|   -- <board>
|      -- eiq_examples/ethosu     - Example build projects
|         -- ethosu_apps_rpmsg    - Ethos-U app with rpmsg example
|         -- ethosu_apps          - Ethos-U app example
|
|-- middleware/eiq/ethos-u-core-software
    -- applications               - The inference process APIs
    -- core_driver                - Ethos-U core driver which includes reading/writing registers
```

## Inference with Ethos-U example applications

### Introduction

The example `ethosu_apps_rpmsg` aims to parse the inference request from Cortex-A core, configure the NPU’s registers, accomplish the inference, and send back the inference result to Cortex-A core. The inference engine is TensorFlow Lite or TensorFlow Lite Micro (TFLM).

The example `ethosu_apps` accomplishes the inference for `conv2d` op model. The inference engine is TensorFlow Lite Micro.

The package contains Ethos-U example applications. The build projects can be found in the `/boards/<board>/demo_apps/ethosu_apps*` folders.

### Toolchains supported

- IAR Embedded Workbench for ARM
- ArmGCC - GNU Tools ARM Embedded

### Supported board and settings

- `mcimx93evk`: No special settings are required.

## Test process

### Example `ethosu_apps_rpmsg`

This example is built as `.out` or `.elf` and installed in `rootfs`. In the Linux command line, users can run the following command to perform inference for the model:

```
# ./inference_runner -d /dev/ethosu0 -n mobilenet_v1_1.0_224_pb_int8_vela.tflite -i stopwatch.bmp -l labels.txt -o output_data_detection -t 1080000000
```

When the example runs, the log and inference result appear on the terminal as shown below:

```
Send Ping
Send version request
Send capabilities request
Capabilities:
        version_status:1
        version:{ major=0, minor=0, patch=0 }
        product:{ major=6, minor=0, patch=0 }
        architecture:{ major=1, minor=0, patch=6 }
        driver:{ major=0, minor=16, patch=0 }
        macs_per_cc:8
        cmd_stream_version:0
        custom_dma:false
Create network
Create inference
Wait for inferences
Inference status: success

Detected: jinrikisha, confidence:70
Detected: horse cart, confidence:70
Detected: academic gown, confidence:70
Detected: howler monkey, confidence:70
```

For other demos, such as face recognition, please refer to the user manual.

### Example `ethosu_apps`

This example is built as `.bin`. In the U-Boot prompt, users can run the following command to perform inference for the `conv2d` op model:

```
u-boot=> tftp 0x80000000 ethosu_apps.bin;cp.b 0x80000000 0x201e0000 0x20000;bootaux 0x201e0000 0
```

When the example runs, the log and inference result appear on the terminal as shown below:

```
Initialize Arm Ethos-U
Inference status: success
```

## Release notes

The software is based on ARM `ethos-u-core-software` version 22.02.

- [Ethos-U Core Software](http://git.mlplatform.org/ml/ethos-u/ethos-u-core-software.git)
- [Ethos-U Core Driver](http://git.mlplatform.org/ml/ethos-u/ethos-u-core-driver.git)

## Limitations

- TBD


