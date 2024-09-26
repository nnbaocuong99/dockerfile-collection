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