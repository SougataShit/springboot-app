# Stage 1: Build the Application
FROM maven:3.9.5-jdk-17 AS MAVEN_BUILD
COPY pom.xml /build/
COPY src /build/src/
WORKDIR /build/
RUN mvn package -DskipTests

# Stage 2: Create the Final Image
FROM openjdk:22-jdk
WORKDIR /app
# Copy the JAR from the build stage
COPY --from=MAVEN_BUILD /build/target/*.jar /app/app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]

