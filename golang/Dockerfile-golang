# syntax=docker/dockerfile:1
# Stage build
FROM golang:1.22-alpine3.19 as buildGo

WORKDIR /src

COPY go.mod go.sum ./   

RUN --mount=type=cache,target=/go/pkg/mod --mount=type=cache,target=/root/.cache/go-build go mod download

COPY . . 

RUN go build -o app-go


# Stage run
FROM alpine:3.19

COPY --from=buildGo /src/app-go /app-go

USER nobody:nobody

EXPOSE 8080

ENTRYPOINT ["/app-go"]