FROM openjdk:8-jdk-alpine
COPY target/product-entry-service-0.0.1-SNAPSHOT.jar /app/product-entry-service-0.0.1-SNAPSHOT.jar
ENTRYPOINT ["java","-jar","/app/product-entry-service-0.0.1-SNAPSHOT.jar"]
