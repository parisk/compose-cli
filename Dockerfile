ARG DOCKER_VERSION=20.10.7
FROM docker:${DOCKER_VERSION} as base

ARG COMPOSE_CLI_VERSION=v2.0.0-beta.3
ARG BINARY_FILE_NAME=docker-compose-linux-amd64
ARG DOCKER_CLI_PLUGINS_DIR=/root/.docker/cli-plugins

RUN mkdir -p ${DOCKER_CLI_PLUGINS_DIR}
RUN wget https://github.com/docker/compose-cli/releases/download/${COMPOSE_CLI_VERSION}/${BINARY_FILE_NAME} &&\
    mv ./${BINARY_FILE_NAME} ${DOCKER_CLI_PLUGINS_DIR}/docker-compose &&\
    chmod +x ${DOCKER_CLI_PLUGINS_DIR}/docker-compose

FROM base as aws

RUN apk add py-pip
RUN pip install awscli==1.18.142