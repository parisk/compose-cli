FROM ubuntu:20.04 as base

ARG COMPOSE_CLI_VERSION=v1.0.17

RUN apt-get update &&\
    apt-get install -y apt-transport-https ca-certificates curl gnupg lsb-release &&\
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg &&\
    echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null &&\
    apt-get update &&\
    apt-get install -y docker-ce-cli

ARG DOWNLOAD_URL=https://github.com/docker/compose-cli/releases/download/v1.0.17/docker-linux-amd64
RUN curl -L https://raw.githubusercontent.com/docker/compose-cli/${COMPOSE_CLI_VERSION}/scripts/install/install_linux.sh | sh

FROM base as aws

RUN apt-get -y install python3-pip
ARG AWS_CLI_VERSION=1.19.90
RUN pip install awscli==${AWS_CLI_VERSION}