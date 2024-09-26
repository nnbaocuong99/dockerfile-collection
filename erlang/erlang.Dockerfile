# Erlang Dockerfile Template

# Build stage
FROM erlang:24 AS build

WORKDIR /app

# Copy rebar.config
COPY rebar.config .

# Copy source files
COPY src src

# Build the release
RUN rebar3 release

# Run stage
FROM erlang:24-slim

WORKDIR /app

# Copy the release from the build stage
COPY --from=build /app/_build/default/rel/myapp ./

# Expose port (if your application uses network)
EXPOSE 8080

# Run the release
CMD ["bin/myapp", "foreground"]

# Optional: Add healthcheck
HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 \
  CMD curl -f http://localhost:8080/health || exit 1

# Optional: Add volume for persistent data
# VOLUME ["/app/data"]

# Optional: Use a non-root user
# RUN useradd -ms /bin/bash appuser
# USER appuser
