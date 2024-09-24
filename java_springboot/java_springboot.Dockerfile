# Java Spring Boot Dockerfile Template

# Build stage
FROM maven:3.8.1-jdk-11-slim AS build
WORKDIR /app
COPY pom.xml .
COPY src ./src
RUN mvn clean package -DskipTests

# Run stage
FROM openjdk:11-jre-slim
WORKDIR /app

# Copy the built artifact from the build stage
COPY --from=build /app/target/*.jar app.jar

# Set environment variables
ENV JAVA_OPTS=""
ENV SERVER_PORT=8080

# Expose the port
EXPOSE $SERVER_PORT

# Run the jar file
ENTRYPOINT ["sh", "-c", "java $JAVA_OPTS -jar app.jar"]

# Optional: Add healthcheck
HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 \
  CMD curl -f http://localhost:$SERVER_PORT/actuator/health || exit 1

# Optional: Add volume for persistent data
# VOLUME ["/app/data"]

# Optional: Use a non-root user
# RUN addgroup --system --gid 1001 appuser
# RUN adduser --system --uid 1001 --gid 1001 appuser
# USER appuser
