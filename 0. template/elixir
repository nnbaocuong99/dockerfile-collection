FROM elixir:1.12-alpine AS builder
WORKDIR /app
ENV MIX_ENV=prod
COPY mix.exs mix.lock ./
RUN mix do deps.get, deps.compile
COPY . .
RUN mix do compile, release

FROM alpine:3.14
RUN apk add --no-cache openssl ncurses-libs
WORKDIR /app
COPY --from=builder /app/_build/prod/rel/my_app ./
RUN adduser -D elixir
USER elixir
CMD ["bin/my_app", "start"]