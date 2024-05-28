# Load local build image to kind cluster (Kubernetes)

Script to load local build docker images to [Kind](https://kind.sigs.k8s.io/).

# Prerequisites
* Docker or Podman
* Kind
* kubectl

# Run the script

``` Load local build image to kind cluster 
Usage: ./load-image-kind.sh <docker-image-with-tag>
Example: ./load-image-kind.sh localhost/goechoapptest ```