# Step 1: Start from the base Ubuntu image
FROM ubuntu:latest

# Step 2: Update package lists and install necessary tools (e.g., wget)
RUN apt-get update && apt-get install -y wget curl net-tools fish

# Step 3: Upgrade installed packages
RUN apt-get upgrade -y

# Step 4: Clean up package cache
RUN apt-get clean

# get java from here https://www.oracle.com/java/technologies/java-archive-javase5-downloads.html 
# Step 5: Copy JDK folder 'jdk1' into the image
COPY jdk1.5.0_22 /usr/local/jdk1.5.0_22

# Step 6: Set the environment variables for Java
ENV JAVA_HOME /usr/local/jdk1.5.0_22
ENV PATH $PATH:$JAVA_HOME/bin


# Download the jboss application at https://sourceforge.net/projects/jboss/files/JBoss/JBoss-5.1.0.GA/
# Step 7: Copy JBoss folder 'jboss-5.1.0.GA' into the image
COPY jboss-5.1.0.GA /opt/jboss-5.1.0.GA

# Step 8: Expose Ports 8080 and 9090
EXPOSE 8080
EXPOSE 9090

# Step 9: Set the working directory to the JBoss folder
WORKDIR /opt/jboss-5.1.0.GA

# Step 10: Set the default command to run JBoss on all interfaces
CMD ["./bin/run.sh", "-b", "0.0.0.0", "-c", "all"]
