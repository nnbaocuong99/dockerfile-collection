# R Dockerfile Template

FROM r-base:4.1.0

# Install system dependencies
RUN apt-get update && apt-get install -y \
    libcurl4-openssl-dev \
    libssl-dev \
    libxml2-dev \
    && rm -rf /var/lib/apt/lists/*

# Install R packages
RUN R -e "install.packages(c('shiny', 'rmarkdown', 'ggplot2'), repos='http://cran.rstudio.com/')"

WORKDIR /app

# Copy R scripts
COPY . .

# Expose port (if your application uses network, e.g., for Shiny apps)
EXPOSE 3838

# Run R script
CMD ["Rscript", "app.R"]

# Optional: Add healthcheck (for web applications)
# HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 \
#   CMD curl -f http://localhost:3838 || exit 1

# Optional: Add volume for persistent data
# VOLUME ["/app/data"]

# Optional: Use a non-root user
# RUN useradd -ms /bin/bash appuser
# USER appuser
