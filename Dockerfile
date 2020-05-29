FROM maven:3.6.3-jdk-8-slim AS build
WORKDIR /home/rating-service
COPY . /home/rating-service
RUN mvn -f /home/rating-service/pom.xml clean package -DskipTests

FROM java:8-jdk-alpine
VOLUME /tmp
COPY --from=build /home/rating-service/target/*.jar rating-service.jar
ENTRYPOINT ["java","-jar","rating-service.jar"]
