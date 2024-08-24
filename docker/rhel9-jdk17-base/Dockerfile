# Stage 1: Base image with essential tools
FROM --platform=$TARGETPLATFORM redhat/ubi9-minimal AS base

USER root

# Update the package repository and install necessary packages
RUN microdnf install yum -y && \
    microdnf install git -y && \
    microdnf install wget zip unzip tar -y && \
    microdnf install vim ca-certificates -y && \
    microdnf clean all

# Stage 2: Install Java 8
FROM base AS java8

RUN microdnf install java-1.8.0-openjdk -y && \
    microdnf clean all

ENV JAVA8_HOME=/usr/lib/jvm/java-1.8.0-openjdk-1.8.0.422.b05-2.el9.x86_64/jre
RUN export PATH=$JAVA8_HOME/bin:$PATH

# Stage 3: Install Java 11
FROM base AS java11

RUN microdnf install java-11-openjdk -y && \
    microdnf clean all

ENV JAVA11_HOME=/usr/lib/jvm/java-11-openjdk-11.0.24.0.8-2.el9.x86_64
RUN export PATH=$JAVA11_HOME/bin:$PATH

# Stage 4: Install Java 17
FROM base AS java17

RUN microdnf install java-17-openjdk -y && \
    microdnf clean all

ENV JAVA17_HOME=/usr/lib/jvm/java-17-openjdk-17.0.12.0.7-2.el9.x86_64
RUN export PATH=$JAVA17_HOME/bin:$PATH

# Stage 5: Final stage with all Java versions and npm installed
FROM base AS final

# Copy Java installations from previous stages
COPY --from=java8 $JAVA8_HOME $JAVA8_HOME
COPY --from=java11 $JAVA11_HOME $JAVA11_HOME
COPY --from=java17 $JAVA17_HOME $JAVA17_HOME

# Install npm and set default Java version
RUN microdnf install npm -y && \
    npm install -g diff2html-cli && \
    microdnf clean all

# Set default Java version to 17
ENV JAVA_HOME=$JAVA17_HOME
RUN export PATH=$JAVA_HOME/bin:$PATH

# Confirm the installation of tools
RUN java -version && \
    git --version && \
    npm --version && \
    curl --version

# Set the working directory
WORKDIR /app

# Add your application files
# ADD . /app

# Set any other configurations as needed

# Start your application
# CMD [ "java", "-jar", "your-app.jar" ]
