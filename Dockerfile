# Base image for MongoDB
FROM mongo:latest

# Install required tools
RUN apt-get update && apt-get install -y wget

# Install OpenJDK 8 for Metabase
RUN apt-get install -y openjdk-8-jdk

# Set up Metabase
WORKDIR /metabase

# Download Metabase JAR file
RUN wget "https://downloads.metabase.com/v0.39.4/metabase.jar"

# Expose MongoDB and Metabase ports
EXPOSE 27017 3000

# Start MongoDB and Metabase
CMD mongod --fork --logpath /var/log/mongodb.log && java -jar /metabase/metabase.jar
