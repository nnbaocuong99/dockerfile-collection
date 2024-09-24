FROM gradle:7.2-jdk11 AS builder
COPY --chown=gradle:gradle . /home/gradle/src
WORKDIR /home/gradle/src
RUN gradle build --no-daemon

FROM openjdk:11-jre-slim
RUN mkdir /app && addgroup --system javauser && adduser --system --ingroup javauser javauser
COPY --from=builder /home/gradle/src/build/libs/*.jar /app/spring-boot-application.jar
WORKDIR /app
RUN chown -R javauser:javauser /app
USER javauser
ENTRYPOINT ["java", "-XX:+UnlockExperimentalVMOptions", "-XX:+UseCGroupMemoryLimitForHeap", "-Djava.security.egd=file:/dev/./urandom","-jar","/app/spring-boot-application.jar"]