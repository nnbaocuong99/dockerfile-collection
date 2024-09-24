FROM node:14-alpine AS builder
WORKDIR /app
COPY package*.json ./
RUN npm ci --only=production
COPY . .
RUN npm run build

FROM nginx:alpine
COPY --from=builder /app/build /usr/share/nginx/html
COPY nginx.conf /etc/nginx/conf.d/default.conf
RUN adduser -D -H -u 1000 -s /sbin/nologin www-data
EXPOSE 80
USER www-data
CMD ["nginx", "-g", "daemon off;"]