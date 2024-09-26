FROM gcc:11.1 AS builder
WORKDIR /usr/src/app
COPY . .
RUN g++ -O3 -std=c++17 -o myapp main.cpp

FROM debian:buster-slim
RUN apt-get update && apt-get install -y --no-install-recommends libstdc++6 && rm -rf /var/lib/apt/lists/*
WORKDIR /usr/local/bin
COPY --from=builder /usr/src/app/myapp .
RUN useradd -m cppuser
USER cppuser
CMD ["./myapp"]
