FROM hseeberger/scala-sbt:8u282_1.5.2_2.13.6 AS builder
WORKDIR /app
COPY build.sbt .
COPY project ./project
RUN sbt update
COPY . .
RUN sbt dist

FROM openjdk:11-jre-slim
WORKDIR /app
COPY --from=builder /app/target/universal/stage ./
RUN groupadd -r playuser && useradd -r -g playuser playuser
USER playuser
EXPOSE 9000
CMD ["bin/myapp", "-Dplay.http.secret.key=ad31779d4ee49d5ad5162bf1429c32e2e9933f3b"]