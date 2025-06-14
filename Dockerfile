FROM eclipse-temurin:21-jdk-alpine AS build

WORKDIR /app

COPY .mvn .mvn
COPY src src
COPY mvnw mvnw
COPY mvnw.cmd mvnw.cmd
COPY pom.xml pom.xml

RUN chmod +x mvnw
RUN ./mvnw clean package

FROM eclipse-temurin:21-jdk-alpine

COPY --from=build /app/target/igrp-eureka-0.0.1-SNAPSHOT.jar ./igrp-eureka.jar

EXPOSE 8081

CMD ["java", "-jar", "./igrp-eureka.jar"]