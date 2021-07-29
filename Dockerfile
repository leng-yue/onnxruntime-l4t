FROM nvcr.io/nvidia/l4t-base:r32.5.0

RUN echo "Building ONNX Runtime Docker image with ${WHEEL_FILE}..."

# Ensure apt-get won't prompt for selecting options
ENV DEBIAN_FRONTEND=noninteractive

# Add Repository
RUN apt-get update && apt-get install -y software-properties-common && \
    add-apt-repository ppa:deadsnakes/ppa && apt-get update

# Install Essential Parts 
RUN apt-get install -y --no-install-recommends python3.9 python3-pip python3.9-dev python3.9-venv \
    build-essential software-properties-common libopenblas-dev cmake unattended-upgrades

# Install base packages
RUN python3.9 -m venv /venv
ENV PATH=/venv/bin:$PATH
RUN pip3 install --upgrade pip
RUN pip3 install setuptools wheel pybind11 pytest

WORKDIR /onnxruntime

# Install Wheel
RUN wget https://nvidia.box.com/shared/static/arhrs7n5ufg7r0iqbtd4jynvvhc8bymh -O onnxruntime_gpu-1.8.0-cp39-cp39-linux_aarch64.whl && \
    pip3 install onnxruntime_gpu-1.8.0-cp39-cp39-linux_aarch64.whl
