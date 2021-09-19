FROM ubuntu:18.04
ENV NODE_ENV=production
RUN apt-get update && apt-get install -y openjdk-11-jre-headless
COPY ["*.jar", "./"]
COPY . .
EXPOSE 8081
CMD ["java", "-jar", "./devops-0.0.1-SNAPSHOT.jar", "&"]
