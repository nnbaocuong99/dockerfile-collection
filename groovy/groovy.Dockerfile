# Groovy Dockerfile Template

# Build stage
FROM groovy:3.0-jdk11 AS build

WORKDIR /app

# Copy build files
COPY build.gradle .
COPY src src

# Build the application
RUN gradle clean build

# Run stage
FROM openjdk:11-jre-slim

WORKDIR /app

# Copy the built jar from the build stage
COPY --from=build /app/build/libs/*.jar ./app.jar

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
