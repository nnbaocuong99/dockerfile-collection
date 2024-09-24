FROM rust:1.54 as builder
WORKDIR /usr/src/myapp
COPY Cargo.toml Cargo.lock ./
RUN mkdir src && echo "fn main() {}" > src/main.rs
RUN cargo build --release
RUN rm -f target/release/deps/myapp*
COPY . .
RUN cargo build --release

FROM debian:buster-slim
RUN apt-get update && apt-get install -y --no-install-recommends ca-certificates && rm -rf /var/lib/apt/lists/*
COPY --from=builder /usr/src/myapp/target/release/myapp /usr/local/bin/myapp
RUN useradd -ms /bin/bash myuser
USER myuser
CMD ["myapp"]