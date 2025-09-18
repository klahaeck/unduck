#!/bin/bash

# Build and run the Docker container
echo "Building Docker image..."
docker build -t unduck .

echo "Running Docker container..."
docker run -p 8082:80 --name unduck-app unduck

echo "App is running at http://localhost:3000"
echo "To stop the container, run: docker stop unduck-app"
echo "To remove the container, run: docker rm unduck-app"

