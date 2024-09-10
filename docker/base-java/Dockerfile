# Java Base Image
FROM --platform=linux/amd64 eclipse-temurin:17-jammy AS jdk-base

# Install Java 8
RUN mkdir -p /usr/lib/jvm/temurin-8-jdk
COPY --from=eclipse-temurin:8-jammy /opt/java/openjdk /usr/lib/jvm/temurin-8-jdk

# Install Java 11
RUN mkdir -p /usr/lib/jvm/temurin-11-jdk
COPY --from=eclipse-temurin:11-jammy /opt/java/openjdk /usr/lib/jvm/temurin-11-jdk

# Install Java 17
RUN mkdir -p /usr/lib/jvm/temurin-17-jdk
COPY --from=eclipse-temurin:17-jammy /opt/java/openjdk /usr/lib/jvm/temurin-17-jdk

# Install Java 21 (optional)
RUN mkdir -p /usr/lib/jvm/temurin-21-jdk
COPY --from=eclipse-temurin:21-jammy /opt/java/openjdk /usr/lib/jvm/temurin-21-jdk

# Verify installations
RUN /usr/lib/jvm/temurin-17-jdk/bin/java -version
