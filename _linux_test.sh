#!/bin/bash

# Function to check Docker installation
check_docker() {
    if ! [ -x "$(command -v docker)" ]; then
        echo "Docker is not installed. Please install Docker first."
        exit 1
    else
        echo "Docker is installed."
    fi
}

# Function to check Docker service status
check_docker_service() {
    if ! (sudo systemctl is-active --quiet docker); then
        echo "Docker service is not running. Starting Docker service..."
        sudo systemctl start docker
    else
        echo "Docker service is running."
    fi
}

# Function to run a test container (hello-world)
run_test_container() {
    echo "Running hello-world test container..."
    docker run hello-world
}

# Function to list Docker images and containers
check_docker_images_containers() {
    echo "Listing Docker images..."
    docker images

    echo "Listing running containers..."
    docker ps
}

# Main script execution
echo "Starting Docker test script..."

check_docker
check_docker_service
run_test_container
check_docker_images_containers

echo "Docker test script finished."
