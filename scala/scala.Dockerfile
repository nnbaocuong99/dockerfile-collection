# Scala Dockerfile Template

# Build stage
FROM hseeberger/scala-sbt:11.0.12_1.5.5_2.13.6 AS build

WORKDIR /app

# Copy the project files
COPY . .

# Build the application
RUN sbt clean assembly

# Run stage
FROM openjdk:11-jre-slim

WORKDIR /app

# Copy the built jar file from the build stage
COPY --from=build /app/target/scala-2.13/*-assembly-*.jar app.jar

# Expose port (if your application uses network)
EXPOSE 8080

# Run the jar file
CMD ["java", "-jar", "app.jar"]

# Optional: Add healthcheck
HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 \
  CMD curl -f http://localhost:8080/health || exit 1

# Optional: Add volume for persistent data
# VOLUME ["/app/data"]

# Optional: Use a non-root user
# RUN useradd -ms /bin/bash appuser
# USER appuser
