FROM clojure:openjdk-11-lein-2.9.5 AS builder
WORKDIR /app
COPY project.clj .
RUN lein deps
COPY . .
RUN lein uberjar

FROM openjdk:11-jre-slim
WORKDIR /app
COPY --from=builder /app/target/uberjar/*-standalone.jar app.jar
RUN groupadd -r clojureuser && useradd -r -g clojureuser clojureuser
USER clojureuser
EXPOSE 8080
CMD ["java", "-jar", "app.jar"]