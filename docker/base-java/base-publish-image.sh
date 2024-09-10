#!/bin/bash

# Variables
LOCAL_IMAGE="murtuza24/java-base"
DOCKER_USERNAME="murtuza24"
REPOSITORY_NAME="java-base"
TAG="amd64-latest"
DOCKER_IMAGE="${DOCKER_USERNAME}/${REPOSITORY_NAME}:${TAG}"

# Build the Docker image
docker build --platform linux/amd64 -t ${LOCAL_IMAGE} .

# Check if the build was successful
if [ $? -eq 0 ]; then
  echo "Docker build successful. Proceeding with tagging and pushing the image."

  # Tag the Docker image
  docker tag ${LOCAL_IMAGE} ${DOCKER_IMAGE}

  # Push the Docker image to Docker Hub
  docker push ${DOCKER_IMAGE}

  echo "Docker image pushed to Docker Hub successfully: ${DOCKER_IMAGE}"
else
  echo "Docker build failed. Image will not be pushed."
  exit 1
fi