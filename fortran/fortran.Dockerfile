# Fortran Dockerfile Template

# Build stage
FROM gcc:latest AS build

WORKDIR /app

# Install gfortran
RUN apt-get update && apt-get install -y gfortran

# Copy source files
COPY . .

# Build the application
RUN gfortran -o myapp main.f90

# Run stage
FROM debian:buster-slim

WORKDIR /app

# Copy the built executable from the build stage
COPY --from=build /app/myapp .

# Expose port (if your application uses network)
EXPOSE 8080

# Run the application
CMD ["./myapp"]

# Optional: Add healthcheck
HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 \
  CMD curl -f http://localhost:8080/health || exit 1

# Optional: Add volume for persistent data
# VOLUME ["/app/data"]

# Optional: Use a non-root user
# RUN useradd -ms /bin/bash appuser
# USER appuser
