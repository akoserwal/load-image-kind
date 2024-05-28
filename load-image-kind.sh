#!/bin/bash

echo "Load local build image to kind cluster "
# Check if the correct number of arguments is provided
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <docker-image-with-tag>"
    echo "Example: ./load-image-kind.sh localhost/goechoapptest"
    exit 1
fi

command_exists() {
  command -v "$1" >/dev/null 2>&1
}

# Check if Docker is installed
if command_exists docker; then
  echo "Docker is installed. Using Docker."
  export DOCKER=docker
else
  echo "Docker not found. Checking for Podman."

  # Check if Podman is installed
  if command_exists podman; then
    echo "Podman is installed. Using Podman."
    export DOCKER=podman
  else
    echo "Podman not found. Please install either Docker or Podman to proceed."
    exit 1
  fi
fi

# Check if kind is installed
if command_exists kind; then
    echo "kind is installed."
else    
    echo "Please install kind"
    exit 1
fi

# Get the Docker image tag from the first argument
DOCKER_IMAGE=$1

# Extract the image name and tag separately
echo $DOCKER_IMAGE

# Remove "localhost/" prefix if it exists
#IMAGE_NAME=$(echo $DOCKER_IMAGE | sed 's/^localhost\///')
IMAGE_NAME=$(echo $DOCKER_IMAGE | sed 's|^.*/||')
echo $IMAGE_NAME

# Define the output tar file name
TAR_FILE="${IMAGE_NAME//:/-}.tar"

# Run the podman save command
${DOCKER} save $DOCKER_IMAGE -o $TAR_FILE

# Run the kind load command
kind load image-archive $TAR_FILE

echo "Image $DOCKER_IMAGE has been saved to $TAR_FILE and loaded into kind."

echo "Removing the $TAR_FILE" 
rm -rf $TAR_FILE

echo "Use the $DOCKER_IMAGE as container image spec"
