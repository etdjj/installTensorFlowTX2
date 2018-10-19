#!/bin/bash
# NVIDIA Jetson TX2
# TensorFlow Installation
# Export TensorFlow GPU environment variables
# WARNING This needs to match setTensorFlowEV.sh settings
export TF_NEED_CUDA=1
export TF_CUDA_VERSION=9.2
export CUDA_TOOLKIT_PATH=/usr/local/cuda
export TF_CUDNN_VERSION=7.1.2
export CUDNN_INSTALL_PATH=/usr/lib/aarch64-linux-gnu/
export TF_CUDA_COMPUTE_CAPABILITIES=6.1

# Build Tensorflow
cd $HOME/tensorflow
bazel build -c opt --copt=-DTF_MIN_GPU_MULTIPROCESSOR_COUNT=2 --local_resources 3072,4.0,1.0 --verbose_failures --config=cuda //tensorflow/tools/pip_package:build_pip_package

