FROM ubuntu

#installing all necessay packages
RUN apt-get update && apt-get install -y
RUN apt install openjdk-17-jre-headless -y
RUN apt install maven -y

#set the working directory
WORKDIR /app

#copy source files and pom.xml
COPY ./src /app/src
COPY ./pom.xml /app

#build the application
RUN mvn -f /app/pom.xml clean package -DskipTests

COPY ./target/*.jar /app/app.jar


EXPOSE 8080

ENTRYPOINT ["java", "-jar", "app.jar"]