#!/bin/bash
set -e

echo "Deploying application..."

docker compose -p react-app down || true
docker compose -p react-app up -d

echo "Deployment completed successfully."
