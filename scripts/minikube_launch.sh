#!/bin/bash

VERSION="${1:-v1.15.5}"
MEMORY="${2:-6144}"
CPU="${3:-2}"

minikube delete || true

minikube start \
  --kubernetes-version "$VERSION" \
  --memory="$MEMORY" \
  --cpus="$CPU"