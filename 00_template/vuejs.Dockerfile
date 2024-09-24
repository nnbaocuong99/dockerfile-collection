FROM node:14-alpine as builder
WORKDIR /app
COPY package*.json ./
RUN npm ci
COPY . .
RUN npm run build

FROM nginx:alpine
COPY --from=builder /app/dist /usr/share/nginx/html
COPY nginx.conf /etc/nginx/nginx.conf
RUN adduser -D -H -u 1000 -s /sbin/nologin www-data
EXPOSE 80
USER www-data
CMD ["nginx", "-g", "daemon off;"]