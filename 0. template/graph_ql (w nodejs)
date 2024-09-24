FROM node:14-alpine AS builder
WORKDIR /app
COPY package*.json ./
RUN npm ci
COPY . .
RUN npm run build

FROM node:14-alpine
WORKDIR /app
COPY --from=builder /app/dist ./dist
COPY --from=builder /app/node_modules ./node_modules
COPY package*.json ./
RUN npm prune --production
RUN addgroup -S graphqluser && adduser -S -G graphqluser graphqluser
USER graphqluser
EXPOSE 4000
CMD ["node", "dist/index.js"]