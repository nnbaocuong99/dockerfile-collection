# Rust Dockerfile Template

# Build stage
FROM rust:1.55 as builder

# Create a new empty shell project
RUN USER=root cargo new --bin app
WORKDIR /app

# Copy manifests
COPY Cargo.lock ./Cargo.lock
COPY Cargo.toml ./Cargo.toml

# Build only the dependencies to cache them
RUN cargo build --release
RUN rm src/*.rs

# Copy the source code
COPY src ./src

# Build for release
RUN rm ./target/release/deps/app*
RUN cargo build --release

# Run stage
FROM debian:buster-slim

# Install necessary dependencies
RUN apt-get update && apt-get install -y --no-install-recommends ca-certificates && rm -rf /var/lib/apt/lists/*

# Copy the build artifact from the build stage
COPY --from=builder /app/target/release/app .

# Set the startup command
CMD ["./app"]

# Expose port
EXPOSE 8080

# Optional: Add healthcheck
HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 \
  CMD curl -f http://localhost:8080/health || exit 1

# Optional: Add volume for persistent data
# VOLUME ["/app/data"]

# Optional: Use a non-root user
# RUN useradd -ms /bin/bash appuser
# USER appuser
