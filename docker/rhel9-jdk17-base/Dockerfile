# Application Image
FROM --platform=$TARGETPLATFORM redhat/ubi9-minimal AS final

# Install necessary packages
RUN microdnf install npm git wget zip unzip tar vim findutils ca-certificates -y && \
    microdnf clean all && \
    rm -rf /var/cache/yum /usr/share/doc /usr/share/man /usr/share/locale

# Create directories for Java installations
RUN mkdir -p /usr/lib/jvm/temurin-8-jdk \
              /usr/lib/jvm/temurin-11-jdk \
              /usr/lib/jvm/temurin-17-jdk \
              /usr/lib/jvm/temurin-21-jdk

# Copy Java installations from the Java base image
COPY --from=murtuza24/java-base /usr/lib/jvm/temurin-8-jdk /usr/lib/jvm/temurin-8-jdk
COPY --from=murtuza24/java-base /usr/lib/jvm/temurin-11-jdk /usr/lib/jvm/temurin-11-jdk
COPY --from=murtuza24/java-base /usr/lib/jvm/temurin-17-jdk /usr/lib/jvm/temurin-17-jdk
COPY --from=murtuza24/java-base /usr/lib/jvm/temurin-21-jdk /usr/lib/jvm/temurin-21-jdk

# Set default Java version
ENV JAVA_HOME=/usr/lib/jvm/temurin-17-jdk
ENV PATH=$JAVA_HOME/bin:$PATH

# Confirm the installation of tools
RUN java -version && \
    echo "Java installations are set up."

# Set the working directory
WORKDIR /app

# Add your application files
#COPY . /app

# Install additional dependencies if needed
RUN npm install -g diff2html-cli

# Start your application
#CMD [ "java", "-jar", "your-app.jar" ]
