FROM swift:5.4 AS builder
WORKDIR /app
COPY Package.swift .
RUN swift package resolve
COPY . .
RUN swift build -c release

FROM swift:5.4-slim
WORKDIR /app
COPY --from=builder /app/.build/release/YourAppName .
RUN useradd -m swiftuser
USER swiftuser
CMD ["./YourAppName"]