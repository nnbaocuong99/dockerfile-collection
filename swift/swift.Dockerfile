# Swift Dockerfile Template

# Build stage
FROM swift:5.5 as build

WORKDIR /app

# Copy entire project
COPY . .

# Build project
RUN swift build -c release

# Run stage
FROM swift:5.5-slim

WORKDIR /app

# Copy build artifacts
COPY --from=build /app/.build/release /app

# Copy Swift runtime libraries
COPY --from=build /usr/lib/swift/linux/libSwift*.so /usr/lib/

# Expose port (if your application uses network)
EXPOSE 8080

# Run executable
CMD ["/app/Run"]

# Optional: Add healthcheck
HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 \
  CMD curl -f http://localhost:8080/health || exit 1

# Optional: Add volume for persistent data
# VOLUME ["/app/data"]

# Optional: Use a non-root user
# RUN useradd -ms /bin/bash appuser
# USER appuser
