FROM crystallang/crystal:1.1.1 AS builder
WORKDIR /app
COPY shard.yml shard.lock ./
RUN shards install --production
COPY . .
RUN crystal build --release --static src/main.cr

FROM scratch
COPY --from=builder /app/main /main
CMD ["/main"]