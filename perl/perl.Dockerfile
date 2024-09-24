# Perl Dockerfile Template

FROM perl:5.34

WORKDIR /app

# Install cpanminus for managing Perl dependencies
RUN cpanm App::cpanminus

# Copy dependency list (if you're using a cpanfile)
COPY cpanfile* ./

# Install dependencies
RUN cpanm --installdeps .

# Copy application code
COPY . .

# Expose port (if your application uses network)
EXPOSE 8080

# Run the Perl script
CMD ["perl", "app.pl"]

# Optional: Add healthcheck
HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 \
  CMD curl -f http://localhost:8080/health || exit 1

# Optional: Add volume for persistent data
# VOLUME ["/app/data"]

# Optional: Use a non-root user
# RUN useradd -ms /bin/bash appuser
# USER appuser
