FROM eclipse-temurin:21-jdk-alpine AS build

WORKDIR /app

COPY .mvn .mvn
COPY src src
COPY mvnw mvnw
COPY mvnw.cmd mvnw.cmd
COPY pom.xml pom.xml

RUN chmod +x mvnw
RUN ./mvnw clean package

FROM eclipse-temurin:21-jre-alpine

RUN apk add --no-cache curl

COPY --from=build /app/target/igrp-eureka-gateway-0.0.1-SNAPSHOT.jar ./igrp-eureka-gateway.jar

EXPOSE 8080

CMD ["java", "-jar", "./igrp-eureka-gateway.jar"]