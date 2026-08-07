#!/bin/bash
set -e

echo "Building Docker image..."

docker build -t react-static-app:v1 .

docker tag react-static-app:v1 navaneethsankarem/dev:latest

echo "Docker image built successfully."
