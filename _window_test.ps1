# Check if Docker is installed
if (-Not (Get-Command docker -ErrorAction SilentlyContinue)) {
    Write-Host "Docker is not installed. Please install Docker first."
    Exit
} else {
    Write-Host "Docker is installed."
}

# Check if Docker is running
$dockerStatus = docker version 2>&1
if ($dockerStatus -like "*Error*") {
    Write-Host "Docker is not running. Please start Docker Desktop."
    Exit
} else {
    Write-Host "Docker is running."
}

# Run a hello-world container to verify Docker functionality
Write-Host "Running hello-world test container..."
docker run hello-world

# List Docker images
Write-Host "Listing Docker images..."
docker images

# List running Docker containers
Write-Host "Listing running containers..."
docker ps

Write-Host "Docker test script completed."
