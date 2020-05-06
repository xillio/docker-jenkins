FROM ubuntu

USER root
WORKDIR /var/jenkins_home

RUN apt-get update

# Install Java, curl and git
ENV DEBIAN_FRONTEND=noninteractive 
RUN  apt-get install -y default-jdk curl git

# Install Docker
RUN curl -fsSL get.docker.com -o get-docker.sh && bash get-docker.sh && rm get-docker.sh

# Install the client
ADD https://repo.jenkins-ci.org/releases/org/jenkins-ci/plugins/swarm-client/3.8/swarm-client-3.8.jar /opt/client.jar
COPY run.sh /opt/run.sh

ENTRYPOINT ["/opt/run.sh"]
