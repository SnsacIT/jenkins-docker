FROM jenkins/jenkins

LABEL maintainer="Muhammad Mada <mhdmada96@gmail.com>"

USER root

RUN apt update

RUN apt-get install ca-certificates
RUN apt-get install curl
RUN apt-get install apt-transport-https
RUN apt-get install -y software-properties-common


RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -

RUN add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu/ bionic stable"


# Install Docker Engine

RUN apt update

RUN apt install -y docker-ce
RUN apt install -y docker-ce-cli 

# Install Docker Compose 
RUN curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

RUN chmod +x /usr/local/bin/docker-compose


# Start Docker
RUN service docker start


