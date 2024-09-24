FROM alpine:3.14 AS builder
RUN apk add --no-cache lua5.3 luarocks
WORKDIR /app
COPY rockspec.lua ./
RUN luarocks install luasocket && \
    luarocks install rockspec.lua

FROM alpine:3.14
RUN apk add --no-cache lua5.3
COPY --from=builder /usr/local/share/lua /usr/local/share/lua
COPY --from=builder /usr/local/lib/lua /usr/local/lib/lua
COPY . /app
WORKDIR /app
RUN adduser -D luauser
USER luauser
CMD ["lua5.3", "main.lua"]