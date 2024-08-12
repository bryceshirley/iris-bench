#!/bin/bash

## ~~~~~~~~~ Build Base Images ~~~~~~~~~

# Build gpu_base image
echo "Building gpu_base image..."
docker build -t gpu_base -f Benchmark_Dockerfiles/Dockerfile.gpu_base .

# Build sciml_base image using gpu_base as base
echo "Building sciml_base image..."
docker build -t sciml_base -f Benchmark_Dockerfiles/sciml_benchmarks/Dockerfile.sciml_base .

# Build mantid_base image using gpu_base as base
echo "Building mantid_base image..."
docker build -t mantid_base -f Benchmark_Dockerfiles/mantid_imaging_benchmarks/Dockerfile.mantid_base .

# Build stemdl_classification image using sciml_base as base
echo "Building Sciml Benchmark: stemdl_classification_base image..."
docker build -t stemdl_classification_base -f Benchmark_Dockerfiles/sciml_benchmarks/Dockerfile.stemdl_classification_base .

## ~~~~~~~~~ Build Sciml Benchmark Images ~~~~~~~~~
echo "Building Sciml Benchmark images..."

# Build synthetic_regression image using sciml_base as base
echo "Building Sciml Benchmark: synthetic_regression image..."
docker build -t synthetic_regression -f Benchmark_Dockerfiles/sciml_benchmarks/Dockerfile.synthetic_regression .

# Build stemdl_classification image using sciml_base as base
echo "Building Sciml Benchmark: stemdl_classification_1gpu image..."
docker build -t stemdl_classification_2gpu -f Benchmark_Dockerfiles/sciml_benchmarks/Dockerfile.stemdl_classification_1gpu .

# Build stemdl_classification image using sciml_base as base
echo "Building Sciml Benchmark: stemdl_classification_2gpu image..."
docker build -t stemdl_classification_2gpu -f Benchmark_Dockerfiles/sciml_benchmarks/Dockerfile.stemdl_classification_2gpu .

# Build mnist_tf_keras image using sciml_base as base
echo "Building Sciml Benchmark: mnist_tf_keras image..."
docker build -t mnist_tf_keras -f Benchmark_Dockerfiles/sciml_benchmarks/Dockerfile.mnist_tf_keras .

## ~~~~~~~~~ Build Mantid Imaging Benchmark Images ~~~~~~~~~
echo "Building Mantid Imaging Benchmark images..."

# Build mantid_run_8 image using sciml_base as base
echo "Building Mantid Imaging Benchmark: mantid_run_8 image..."
docker build -t mantid_run_1 -f Benchmark_Dockerfiles/mantid_imaging_benchmarks/Dockerfile.mantid_run_8 .

# Build mantid_run_1 image using sciml_base as base
echo "Building Mantid Imaging Benchmark: mantid_run_1 image..."
docker build -t mantid_run_8 -f Benchmark_Dockerfiles/mantid_imaging_benchmarks/Dockerfile.mantid_run_1 .

## ~~~~~~~~~ Building Dummy Container Images ~~~~~~~~~
echo "Building Dummy Container image..."
docker build -t dummy_container -f Benchmark_Dockerfiles/dummy/Dockerfile.dummy_container .

echo -e "Build process completed.\n"