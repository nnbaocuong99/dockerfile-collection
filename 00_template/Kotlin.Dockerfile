FROM gradle:7.2-jdk11 AS builder
COPY --chown=gradle:gradle . /home/gradle/src
WORKDIR /home/gradle/src
RUN gradle build --no-daemon

FROM openjdk:11-jre-slim
RUN mkdir /app && addgroup --system kotlinuser && adduser --system --ingroup kotlinuser kotlinuser
COPY --from=builder /home/gradle/src/build/libs/*.jar /app/kotlin-application.jar
WORKDIR /app
RUN chown -R kotlinuser:kotlinuser /app
USER kotlinuser
CMD ["java", "-jar", "/app/kotlin-application.jar"]