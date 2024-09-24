FROM rust:1.54 as builder
RUN rustup target add wasm32-unknown-unknown
RUN cargo install wasm-pack
WORKDIR /usr/src/app
COPY . .
RUN wasm-pack build --target web

FROM nginx:alpine
COPY --from=builder /usr/src/app/pkg /usr/share/nginx/html/pkg
COPY index.html /usr/share/nginx/html/
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]