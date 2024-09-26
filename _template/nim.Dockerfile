FROM nimlang/nim:1.4.8 AS builder
WORKDIR /usr/src/app
COPY . .
RUN nimble build -d:release

FROM debian:buster-slim
RUN apt-get update && apt-get install -y --no-install-recommends libssl1.1 && rm -rf /var/lib/apt/lists/*
COPY --from=builder /usr/src/app/myapp /usr/local/bin/myapp
RUN useradd -m nimuser
USER nimuser
CMD ["myapp"]