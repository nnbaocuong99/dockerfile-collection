FROM hseeberger/scala-sbt:8u282_1.5.2_2.13.6 AS builder
WORKDIR /app
COPY build.sbt .
COPY project ./project
RUN sbt update
COPY . .
RUN sbt assembly

FROM openjdk:11-jre-slim
WORKDIR /app
COPY --from=builder /app/target/scala-2.13/*-assembly-*.jar app.jar
RUN groupadd -r scalauser && useradd -r -g scalauser scalauser
USER scalauser
ENTRYPOINT ["java", "-jar", "app.jar"]