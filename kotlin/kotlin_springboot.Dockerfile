# Kotlin (Spring Boot) Dockerfile Template

# Build stage
FROM gradle:7.2-jdk11 AS build

WORKDIR /app

# Copy project files
COPY build.gradle.kts settings.gradle.kts ./
COPY src ./src

# Build the application
RUN gradle build --no-daemon

# Run stage
FROM openjdk:11-jre-slim

WORKDIR /app

# Copy the built jar file from the build stage
COPY --from=build /app/build/libs/*.jar app.jar

# Expose port
EXPOSE 8080

# Run the jar file
ENTRYPOINT ["java", "-jar", "/app/app.jar"]

# Optional: Add healthcheck
HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 \
  CMD curl -f http://localhost:8080/actuator/health || exit 1

# Optional: Add volume for persistent data
# VOLUME ["/app/data"]

# Optional: Use a non-root user
# RUN adduser -D appuser
# USER appuser
