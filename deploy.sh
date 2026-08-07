#!/bin/bash

echo "Deploying application..."

docker compose down
docker compose up -d

echo "Deployment completed successfully."
