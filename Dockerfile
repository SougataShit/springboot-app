# Stage 1: Build the Application
FROM maven:3.9-eclipse-temurin-17 AS maven_build
COPY pom.xml /build/
COPY src /build/src/
WORKDIR /build/
RUN mvn package -DskipTests

# Stage 2: Create the Final Image
FROM eclipse-temurin:17-jre-alpine
WORKDIR /app
COPY --from=maven_build /build/target/*.jar /app/app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]