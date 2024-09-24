FROM groovy:3.0.8-jdk11 AS builder
WORKDIR /app
COPY . .
RUN groovyc -d classes *.groovy

FROM openjdk:11-jre-slim
WORKDIR /app
COPY --from=builder /app/classes .
RUN useradd -m groovyuser
USER groovyuser
CMD ["java", "-cp", ".", "Main"]