# Node.js Dockerfile Template

# Base image options (uncomment one)
FROM node:14-alpine
# FROM node:14-slim
# FROM node:14

# Create app directory
WORKDIR /usr/src/app

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
COPY package*.json ./

RUN npm install
# If you are building your code for production
# RUN npm ci --only=production

# Bundle app source
COPY . .

# Build the app (uncomment if using TypeScript or a build step)
# RUN npm run build

# Expose port
EXPOSE 3000

# Set NODE_ENV (uncomment one)
# ENV NODE_ENV=production
ENV NODE_ENV=development

# Run the app
CMD [ "node", "app.js" ]

# Optional: Use a non-root user
# USER node

# Optional: Add healthcheck
HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 \
  CMD node healthcheck.js

# Optional: Add volume for persistent data
# VOLUME ["/usr/src/app/data"]
