#!/bin/bash
set -e

echo "Deploying application..."

docker compose down || true

docker compose up -d

echo "Deployment completed successfully."
