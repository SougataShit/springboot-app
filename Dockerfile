FROM openjdk:22-jdk
ADD target/sonai1.jar sonai1.jar
ENTRYPOINT ["java","-jar","/sonai1.jar"]