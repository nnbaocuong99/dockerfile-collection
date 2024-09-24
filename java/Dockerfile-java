# syntax=docker/dockerfile:1
# stage-build
FROM maven:3.8.4-jdk-11@sha256:bf5cb3d5ac99bc24110b8dd810f0313c52c63a3a2a708060d540d1324112b6c5 as jarBuilder

WORKDIR /src

COPY . .

RUN --mount=type=cache,target=/root/.m2 mvn -T 1C -B -U -s .m2/settings.xml clean package -DskipTests

# stage-run
FROM eclipse-temurin:11.0.16.1_1-jre-focal@sha256:76245981725c32267cebbd9a1906b1860633c95a36ab1d910a35c532dfc7fabd

WORKDIR /application

COPY --from=jarBuilder /src/target/*.jar ./application.jar

ENTRYPOINT ["java", "-javaagent:apm.jar", "-jar", "application.jar"]
