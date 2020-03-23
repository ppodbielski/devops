FROM maven:3-jdk-8 as base
COPY src/ /src
COPY pom.xml /

RUN mvn clean package

FROM openjdk:8 as base-run
COPY --from=base /target/rest-service-*.jar /rest-service.jar
CMD ["java", "-jar", "/rest-service.jar"]