#!/bin/bash

# Set the directory where your docker-compose.yml file is located
DOCKER_COMPOSE_DIR="$(pwd)"

# Navigate to the directory with your docker-compose.yml
cd "$DOCKER_COMPOSE_DIR" || { echo "Directory not found! Exiting."; exit 1; }

# Pull the latest Pi-hole Docker image
echo "Pulling the latest Pi-hole Docker image..."
docker pull pihole/pihole:latest

# Check if the Pi-hole image was pulled successfully
if [ $? -ne 0 ]; then
    echo "Failed to pull the latest Pi-hole image. Exiting."
    exit 1
fi

# Clean up unused Docker images (only images not used by any container)
echo "Cleaning up unused Docker images..."
docker image prune -f

# Clean up dangling volumes (volumes not used by any containers)
echo "Cleaning up dangling volumes..."
docker volume prune -f

# Clean up stopped containers (those that are not running)
echo "Cleaning up stopped containers..."
docker container prune -f

# Stop the current Pi-hole container
echo "Stopping the current Pi-hole container..."
docker-compose down

# Bring down the current container
echo "Stopping the current Pi-hole container..."
docker-compose down

# Bring up the new container with the latest image
echo "Starting the Pi-hole container with the latest image..."
docker compose up -d

# Check the status of the container
echo "Checking the status of the Pi-hole container..."
docker compose ps

echo "Upgrade completed!"
