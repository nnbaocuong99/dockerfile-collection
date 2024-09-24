FROM nginx:alpine AS builder
COPY nginx.conf /etc/nginx/nginx.conf
COPY . /usr/share/nginx/html
RUN chmod -R 755 /usr/share/nginx/html

FROM nginx:alpine
COPY --from=builder /etc/nginx/nginx.conf /etc/nginx/nginx.conf
COPY --from=builder /usr/share/nginx/html /usr/share/nginx/html
RUN adduser -D -H -u 1000 -s /sbin/nologin www-data
EXPOSE 80
USER www-data
CMD ["nginx", "-g", "daemon off;"]