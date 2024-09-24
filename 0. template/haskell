FROM haskell:8.10 AS builder
WORKDIR /app
COPY stack.yaml package.yaml ./
RUN stack setup
COPY . .
RUN stack build --system-ghc --copy-bins

FROM debian:buster-slim
RUN apt-get update && apt-get install -y libgmp10 && rm -rf /var/lib/apt/lists/*
COPY --from=builder /root/.local/bin/my-project-exe /usr/local/bin/
RUN useradd -m haskelluser
USER haskelluser
CMD ["my-project-exe"]