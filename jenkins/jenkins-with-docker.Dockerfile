FROM jenkins/jenkins:jdk21

USER root

# Install docker CLI (Ubuntu/Debian base assumed)
RUN apt-get update && \
    apt-get install -y docker.io && \
    rm -rf /var/lib/apt/lists/*

RUN usermod -aG systemd-network jenkins

USER jenkins
