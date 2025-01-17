# FROM registry.access.redhat.com/ubi8/ubi-minimal:8.5

# MAINTAINER Muhammad Edwin < edwin at redhat dot com >

# LABEL BASE_IMAGE="registry.access.redhat.com/ubi8/ubi-minimal:8.5"
# LABEL JAVA_VERSION="11"

# RUN microdnf install --nodocs java-11-openjdk-headless && microdnf clean all

# WORKDIR /work/
# COPY target/*.jar /work/application.jar

# EXPOSE 8080
# CMD ["java", "-jar", "application.jar"]


# Use an official OpenJDK runtime as the base for the final image
FROM openjdk:17-jdk-slim
 
# Set the working directory inside the container
WORKDIR /app
 
# Copy the packaged JAR file from the build stage
COPY target/*.jar app.jar
 
# Expose the application port (adjust if needed)
EXPOSE 8080
 
# Run the application
CMD ["java", "-jar", "app.jar"]
