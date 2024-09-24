# C++ Dockerfile Template

# Build stage
FROM gcc:latest AS build

WORKDIR /app

# Copy the source code
COPY . .

# Install any needed packages
RUN apt-get update && apt-get install -y \
    cmake \
    make \
    && rm -rf /var/lib/apt/lists/*

# Build the application
RUN mkdir build && cd build && \
    cmake .. && \
    make

# Run stage
FROM debian:buster-slim

WORKDIR /app

# Copy the built executable from the build stage
COPY --from=build /app/build/your_executable .

# Install any runtime dependencies
RUN apt-get update && apt-get install -y \
    libstdc++6 \
    && rm -rf /var/lib/apt/lists/*

# Expose port (if your application uses network)
EXPOSE 8080

# Run the executable
CMD ["./your_executable"]

# Optional: Add healthcheck
HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 \
  CMD curl -f http://localhost:8080/health || exit 1

# Optional: Add volume for persistent data
# VOLUME ["/app/data"]

# Optional: Use a non-root user
# RUN useradd -ms /bin/bash appuser
# USER appuser
