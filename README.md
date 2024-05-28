# Load local build image to kind cluster (Kubernetes)

Script to load local build docker images to [Kind](https://kind.sigs.k8s.io/).

[How to load the local docker image in kind kubernetes cluster](https://akoserwal.medium.com/how-to-load-the-local-docker-image-in-kind-kubernetes-cluster-a21f0b8327ba)

# Prerequisites
* Docker or Podman
* Kind
* kubectl

# Run the script

``` Load local build image to kind cluster 
Usage: ./load-image-kind.sh <docker-image-with-tag>
Example: ./load-image-kind.sh localhost/goechoapptest ```

## Run directly

`sh -c "$(curl -fsSL https://raw.githubusercontent.com/akoserwal/load-image-kind/main/load-image-kind.sh)" localhost/goechoapptest `
