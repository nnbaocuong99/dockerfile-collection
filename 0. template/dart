FROM google/dart:2.13 AS builder
WORKDIR /app
COPY pubspec.* ./
RUN dart pub get
COPY . .
RUN dart compile exe bin/main.dart -o bin/main

FROM debian:buster-slim
RUN apt-get update && apt-get install -y --no-install-recommends libssl1.1 ca-certificates && rm -rf /var/lib/apt/lists/*
COPY --from=builder /app/bin/main /app/main
RUN useradd -m dartuser
USER dartuser
CMD ["/app/main"]