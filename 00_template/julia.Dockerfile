FROM julia:1.6 AS builder
WORKDIR /app
COPY Project.toml Manifest.toml ./
RUN julia -e 'using Pkg; Pkg.activate("."); Pkg.instantiate()'
COPY . .
RUN julia -e 'using PackageCompiler; create_app(".", "build")'

FROM julia:1.6-slim
WORKDIR /app
COPY --from=builder /app/build .
RUN useradd -m juliauser
USER juliauser
CMD ["./bin/YourAppName"]