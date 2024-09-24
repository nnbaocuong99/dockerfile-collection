# Haskell Dockerfile Template

# Build stage
FROM haskell:8.10 as build

WORKDIR /app

# Copy project files
COPY . .

# Build project
RUN stack build --system-ghc

# Run stage
FROM debian:buster-slim

WORKDIR /app

# Install runtime dependencies
RUN apt-get update && apt-get install -y \
    libgmp10 \
    && rm -rf /var/lib/apt/lists/*

# Copy executable
COPY --from=build /app/.stack-work/dist/x86_64-linux/Cabal-3.2.1.0/build/myapp-exe/myapp-exe .

# Expose port (if your application uses network)
EXPOSE 8080

# Run executable
CMD ["./myapp-exe"]

# Optional: Add healthcheck
HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 \
  CMD curl -f http://localhost:8080/health || exit 1

# Optional: Add volume for persistent data
# VOLUME ["/app/data"]

# Optional: Use a non-root user
# RUN useradd -ms /bin/bash appuser
# USER appuser
