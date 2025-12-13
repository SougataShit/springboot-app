# Stage 1: Build the Application
FROM maven:3.9.5-eclipse-temurin-17 AS MAVEN_BUILD
COPY pom.xml /build/
COPY src /build/src/
WORKDIR /build/
RUN mvn package -DskipTests

# Stage 2: Create the Final Image
FROM openjdk:17-jre-slim
WORKDIR /app
# Copy the JAR from the build stage
COPY --from=MAVEN_BUILD /build/target/*.jar /app/app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]

