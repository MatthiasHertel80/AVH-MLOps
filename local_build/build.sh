#!/bin/bash

# Check if the license code is provided as an argument
LICENSE_CODE=${1:-}

# Make sure Docker engine is installed
if ! command -v docker &> /dev/null
then
    echo "Docker is not installed. Please install Docker and try again."
    exit 1
fi

# Check if Docker daemon is running
DOCKER_INFO=$(docker info 2>&1)
if [[ $DOCKER_INFO == *"Cannot connect to the Docker daemon"* ]]; then
    echo "Docker is not running. Please start Docker and try again."
    exit 1
fi

# Build the base image
docker build -t arm-mlops-docker-base:latest -f ../docker_base/Dockerfile ../docker_base --platform=linux/amd64 --no-cache --progress=plain

# Run an instance of the image in a container
docker run -d --name build_container -v ./:/workspace --platform=linux/amd64 arm-mlops-docker-base:latest sleep infinity

# If the license code is provided, export it and copy to build folder
if [[ -n "$LICENSE_CODE" ]]; then
    docker exec build_container armlm activate --code $LICENSE_CODE --as-user arm_mlops_docker --to-file /workspace/arm_mlops_docker_license
    cp ../arm_mlops_docker_license ../docker_licensed/arm_mlops_docker_license
fi

docker stop build_container
docker rm build_container

# Build an image based on the base image, adding the license. This needs to be rebuild whenever the license expires
docker build -t arm-mlops-docker-licensed:latest -f ../docker_licensed/Dockerfile ../docker_licensed --build-arg BASE_IMAGE=arm-mlops-docker-base  --platform=linux/amd64



