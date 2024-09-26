# OCaml Dockerfile Template

# Build stage
FROM ocaml/opam:debian-10-ocaml-4.11 AS build

WORKDIR /app

# Copy opam file
COPY myapp.opam .

# Install dependencies
RUN opam install . --deps-only

# Copy source files
COPY . .

# Build the application
RUN opam config exec -- dune build

# Run stage
FROM debian:buster-slim

WORKDIR /app

# Install runtime dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    libgmp10 \
    && rm -rf /var/lib/apt/lists/*

# Copy the built executable from the build stage
COPY --from=build /app/_build/default/bin/main.exe ./myapp

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
