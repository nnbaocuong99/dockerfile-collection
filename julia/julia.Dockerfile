# Julia Dockerfile Template

FROM julia:1.6

WORKDIR /app

# Copy Project.toml and Manifest.toml (if you're using them)
COPY Project.toml Manifest.toml ./

# Install dependencies
RUN julia --project=. -e 'using Pkg; Pkg.instantiate()'

# Copy Julia files
COPY . .

# Precompile packages
RUN julia --project=. -e 'using Pkg; Pkg.precompile()'

# Expose port (if your application uses network)
EXPOSE 8080

# Run the Julia script
CMD ["julia", "--project=.", "app.jl"]

# Optional: Add healthcheck
HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 \
  CMD curl -f http://localhost:8080/health || exit 1

# Optional: Add volume for persistent data
# VOLUME ["/app/data"]

# Optional: Use a non-root user
# RUN useradd -ms /bin/bash appuser
# USER appuser
