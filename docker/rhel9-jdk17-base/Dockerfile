# Use the Red Hat Enterprise Linux 9 base image
FROM redhat/ubi9-minimal

USER root

# Update the package repository and install necessary packages
RUN microdnf install yum -y && \
    microdnf install git -y && \
    microdnf install java-11-openjdk java-17-openjdk java-1.8.0-openjdk -y
# Set JAVA_HOME environment variables
ENV JAVA_HOME=/usr/lib/jvm/java-11 \
    JAVA_HOME_17=/usr/lib/jvm/java-17 \
    JAVA_HOME_11=/usr/lib/jvm/java-11 \
    JAVA_HOME_8=/usr/lib/jvm/java-1.8.0-openjdk

RUN export PATH=$JAVA_HOME/bin:$PATH

# Confirm the installation
RUN java -version && \
    git --version && \
    curl --version

# Set the working directory
WORKDIR /app

# Add your application files
# ADD . /app

# Set any other configurations as needed

# Start your application
# CMD [ "java", "-jar", "your-app.jar" ]
