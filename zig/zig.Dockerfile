# Zig Dockerfile Template

# Build stage
FROM ziglang/zig:latest AS build

WORKDIR /app

# Copy source files
COPY . .

# Build the application
RUN zig build-exe src/main.zig -O ReleaseSafe

# Run stage
FROM debian:buster-slim

WORKDIR /app

# Copy the built executable from the build stage
COPY --from=build /app/main .

# Expose port (if your application uses network)
EXPOSE 8080

# Run the application
CMD ["./main"]

# Optional: Add healthcheck
HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 \
  CMD curl -f http://localhost:8080/health || exit 1

# Optional: Add volume for persistent data
# VOLUME ["/app/data"]

# Optional: Use a non-root user
# RUN useradd -ms /bin/bash appuser
# USER appuser
