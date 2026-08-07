#!/bin/bash

echo "Building Docker image"

docker build -t react-static-app:v1 .

echo "Docker image built successfully."
