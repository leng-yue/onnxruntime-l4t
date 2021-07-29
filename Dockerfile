FROM nvcr.io/nvidia/l4t-base:r32.5.0

# Ensure apt-get won't prompt for selecting options
ENV DEBIAN_FRONTEND=noninteractive

# Add repository
RUN apt-get update && apt-get install -y software-properties-common && \
    add-apt-repository ppa:deadsnakes/ppa && apt-get update

# Install essential parts 
RUN apt-get install -y --no-install-recommends python3.9 python3-pip python3.9-dev python3.9-venv \
    build-essential software-properties-common libopenblas-dev cmake unattended-upgrades

# Install base packages
RUN python3.9 -m venv /venv
ENV PATH=/venv/bin:$PATH
RUN pip3 install --upgrade pip
RUN pip3 install setuptools wheel pybind11 pytest

WORKDIR /onnxruntime

# Install wheel
RUN wget https://github.com/leng-yue/onnxruntime-l4t/releases/download/v1.8.0/onnxruntime_gpu_tensorrt-1.8.0-cp39-cp39-linux_aarch64.whl && \
    pip3 install onnxruntime_gpu_tensorrt-1.8.0-cp39-cp39-linux_aarch64.whl
