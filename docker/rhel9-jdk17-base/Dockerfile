# Use the Red Hat Enterprise Linux 9 base image
FROM redhat/ubi9-minimal:latest

USER root

ARG CLI_VERSION=3.10.10

# Update the package repository and install necessary packages
RUN microdnf install yum -y && \
    microdnf install git -y && \
    microdnf install zip -y && \
    microdnf install npm -y && \
    microdnf install java-17-openjdk -y && \
    microdnf clean all
# Set JAVA_HOME environment variables
ENV JAVA_HOME=/usr/lib/jvm/java-17

RUN export PATH=$JAVA_HOME/bin:$PATH

# Confirm the installation
RUN java -version && \
    git --version && \
    npm --version && \
    curl --version

RUN npm install -g diff2html-cli

#RUN curl --request GET --url https://repo1.maven.org/maven2/io/moderne/moderne-cli/{$CLI_VERSION}/moderne-cli-{$CLI_VERSION}.jar --output mod.jar
#
# Set the working directory
WORKDIR /app

ADD mod.jar mod.jar
RUN chmod +x mod.jar

# Add your application files
# ADD . /app

# Set any other configurations as needed

# Start your application
# CMD [ "java", "-jar", "your-app.jar" ]