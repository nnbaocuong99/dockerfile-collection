# Dart (Flutter) Dockerfile Template

# Build stage
FROM google/dart:2.13 AS build

# Install Flutter
RUN git clone https://github.com/flutter/flutter.git /usr/local/flutter
ENV PATH="/usr/local/flutter/bin:/usr/local/flutter/bin/cache/dart-sdk/bin:${PATH}"
RUN flutter doctor -v
RUN flutter channel stable
RUN flutter upgrade

WORKDIR /app

# Copy app files
COPY . .

# Get app dependencies
RUN flutter pub get

# Build for web
RUN flutter build web

# Run stage
FROM nginx:1.21-alpine

COPY --from=build /app/build/web /usr/share/nginx/html

# Expose port
EXPOSE 80

# Start Nginx server
CMD ["nginx", "-g", "daemon off;"]

# Optional: Add healthcheck
HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 \
  CMD curl -f http://localhost:80 || exit 1

# Optional: Add volume for persistent data
# VOLUME ["/usr/share/nginx/html/assets"]

# Optional: Use a non-root user (note: might need to adjust nginx.conf)
# RUN adduser -D appuser
# USER appuser
