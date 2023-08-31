#!/usr/bin/env bash

#=========================================
# 
# Title: build.sh
# Author: Andrew Naylor
# Date: Aug 23
# Brief: Building Triton with nvtx for Perlmutter
#
#=========================================

#Configs
CWD=$PWD
CMAKE_DIR=$CWD/build
BUILD_DIR=$SCRATCH/exatrxk/tmp/fork_build/
CONTAINER_SOFTWARE="podman-hpc"
NCORES=32
MIN_CUDA_COMPUTE="8.0"

#Build Triton
./build.py \
    --verbose \
    --cmake-dir=$CMAKE_DIR \
    --build-dir=$BUILD_DIR \
    --container-software="$CONTAINER_SOFTWARE" \
    --no-container-source \
    --enable-logging \
    --enable-stats \
    --enable-tracing \
    --enable-metrics \
    --enable-gpu-metrics \
    --enable-gpu \
    --enable-nvtx \
    --min-compute-capability=$MIN_CUDA_COMPUTE \
    --endpoint=http --endpoint=grpc \
    --backend=ensemble --backend=python --backend=pytorch \
    -j $NCORES
