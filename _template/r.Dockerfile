FROM rocker/r-ver:4.1.0 AS builder
RUN apt-get update && apt-get install -y \
    libcurl4-openssl-dev \
    libssl-dev \
    libxml2-dev
COPY install_packages.R /tmp/
RUN Rscript /tmp/install_packages.R

FROM rocker/r-ver:4.1.0
COPY --from=builder /usr/local/lib/R/site-library /usr/local/lib/R/site-library
COPY . /app
WORKDIR /app
RUN addgroup --system ruser && adduser --system --ingroup ruser ruser
USER ruser
CMD ["Rscript", "app.R"]