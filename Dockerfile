# Stage 1: Build the Application
FROM maven:3.9.5-jdk-17 AS MAVEN_BUILD
COPY pom.xml /build/
COPY src /build/src/
WORKDIR /build/

# Add verbose output to see what's happening
RUN mvn package -DskipTests -X

# List the contents of target directory to see what was built
RUN echo "Contents of /build/target/:" && ls -la /build/target/

# Stage 2: Create the Final Image
FROM eclipse-temurin:17-jre-alpine
WORKDIR /app

# Try to copy and show what we're copying
COPY --from=MAVEN_BUILD /build/target/*.jar /app/app.jar
RUN echo "Contents of /app/:" && ls -la /app/

EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]