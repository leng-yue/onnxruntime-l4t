# ONNXRuntime L4T Docker Builder
[<img src="https://img.shields.io/badge/ghcr.io-images-informational.svg?logo=docker">](https://github.com/leng-yue/onnxruntime-l4t/packages)

This repo use github action to build docker image for L4T. Onnxruntime wheels can be found at [elinux.org](https://elinux.org/Jetson_Zoo#ONNX_Runtime).

Supported version:
- python: 3.9
- onnxuntime: 1.11.1
- l4t-base: r32.7.1

Tested device:
- NVIDIA Jetson Nano

Supported onnxruntime providers:
- TensorrtExecutionProvider
- CUDAExecutionProvider
- CPUExecutionProvider

<del>In order to support tensorrt, we can only build the wheel on a physical machine, you can download the prebuilt wheel from release.</del>
