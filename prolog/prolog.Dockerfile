# Prolog Dockerfile Template

FROM swipl:latest

WORKDIR /app

# Copy Prolog files
COPY . .

# Expose port (if your application uses network)
EXPOSE 8000

# Run the Prolog application
CMD ["swipl", "-s", "main.pl", "-g", "server(8000)", "-t", "halt"]

# Optional: Add healthcheck
HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 \
  CMD curl -f http://localhost:8000/health || exit 1

# Optional: Add volume for persistent data
# VOLUME ["/app/data"]

# Optional: Use a non-root user
# RUN useradd -ms /bin/bash appuser
# USER appuser
