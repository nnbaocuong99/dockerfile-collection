# Crystal Dockerfile Template

# Build stage
FROM crystallang/crystal:1.1.1 as build

WORKDIR /app

# Copy project files
COPY . .

# Build project
RUN shards install
RUN crystal build --release src/app.cr

# Run stage
FROM debian:buster-slim

WORKDIR /app

# Install runtime dependencies
RUN apt-get update && apt-get install -y \
    libevent-2.1-6 \
    libgc1c2 \
    libpcre3 \
    && rm -rf /var/lib/apt/lists/*

# Copy executable
COPY --from=build /app/app .

# Expose port (if your application uses network)
EXPOSE 8080

# Run executable
CMD ["./app"]

# Optional: Add healthcheck
HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 \
  CMD curl -f http://localhost:8080/health || exit 1

# Optional: Add volume for persistent data
# VOLUME ["/app/data"]

# Optional: Use a non-root user
# RUN useradd -ms /bin/bash appuser
# USER appuser
