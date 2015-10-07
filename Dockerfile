FROM java:7 

# Install maven
RUN apt-get update  
RUN apt-get install -y maven

WORKDIR /code

# Prepare by downloading dependencies
ADD pom.xml /code/pom.xml  
RUN ["mvn", "dependency:resolve"]  
RUN ["mvn", "verify"]

# Adding source
ADD src /code/src

# Running tests  
RUN ["mvn", "test"]