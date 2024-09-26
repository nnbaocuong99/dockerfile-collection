## Build

### Linux

```dockerfile
# Use an official Ubuntu base image
FROM ubuntu:latest

# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive

# Install necessary packages
RUN apt-get update && \
    apt-get install -y \
    curl \
    vim \
    git \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Set the working directory
WORKDIR /app

# Copy your application files (if any)
# COPY . .

# Expose a port (if needed, for example 80)
EXPOSE 80

# Command to run your application (if applicable)
# CMD ["custom command"]
```

<br>

### Windows

```dockerfile
# Use the official Windows Server Core base image
FROM mcr.microsoft.com/windows/servercore:ltsc2022

# Set the working directory
WORKDIR /app

# Copy your application files (if any)
# COPY . .

# Install necessary tools (example: curl)
RUN powershell -Command \
    curl -o curl.zip https://curl.se/windows/dl-7.79.0_3/curl-7.79.0-win64-mingw.zip; \
    Expand-Archive curl.zip -DestinationPath C:\; \
    Remove-Item curl.zip; \
    Rename-Item 'C:\curl-7.79.0-win64-mingw' C:\curl; \
    setx PATH "%PATH%;C:\curl"

# Expose a port (if needed, for example 80)
EXPOSE 80

# Command to run your application (if applicable)
# CMD ["custom-command"]
```

### MacOS

*Since Docker on macOS uses a Linux VM, your Dockerfile will also be similar to the Ubuntu example.*

```dockerfile
# Use an official Ubuntu base image
FROM ubuntu:latest

# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive

# Install necessary packages
RUN apt-get update && \
    apt-get install -y \
    curl \
    vim \
    git \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Set the working directory
WORKDIR /app

# Copy your application files (if any)
# COPY . .

# Expose a port (if needed, for example 80)
EXPOSE 80

# Command to run your application (if applicable)
# CMD ["custom-command"]
```

> [!warning]
> ### Key points
> - **Ubuntu and macOS** both are based on the official Ubuntu image since Docker containers for macOS are built on top of Linux VMs.
> - **Customizations**: You can customize the `COPY` command to add your application files and modify the `CMD` command to run your application as needed.
>
> <br>
>
> ### Building Docker image
> - Navigate to the directory containing the Dockerfile and run:
>   ```ruby
>   $ docker build -t your-image-name .
>   ```
> - Replace `your-image-name` with the desired name for your Docker image.

<br>

## Runtime usage

- Save the **`RUNTIME`** files with appropriate extensions (e.g., `.py`,`.js`, `.rb`,...)
- Save the test scripts with appropriate names and extensions and also need to install testing frameworks: