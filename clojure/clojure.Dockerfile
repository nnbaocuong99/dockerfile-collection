# Clojure Dockerfile Template

# Build stage
FROM clojure:openjdk-11-lein AS build

WORKDIR /app

# Copy project files
COPY project.clj .
COPY src src

# Build the application
RUN lein uberjar

# Run stage
FROM openjdk:11-jre-slim

WORKDIR /app

# Copy the uberjar from the build stage
COPY --from=build /app/target/uberjar/*-standalone.jar ./app.jar

# Expose port (if your application uses network)
EXPOSE 8080

# Run the jar
CMD ["java", "-jar", "app.jar"]

# Optional: Add healthcheck
HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 \
  CMD curl -f http://localhost:8080/health || exit 1

# Optional: Add volume for persistent data
# VOLUME ["/app/data"]

# Optional: Use a non-root user
# RUN useradd -ms /bin/bash appuser
# USER appuser
