ARG DOCKER_VERSION=20.10.5
FROM docker:${DOCKER_VERSION}

ARG COMPOSE_CLI_VERSION=v1.0.9
RUN wget https://github.com/docker/compose-cli/releases/download/${COMPOSE_CLI_VERSION}/docker-linux-amd64.tar.gz &&\
    tar xzf docker-linux-amd64.tar.gz &&\
    rm docker-linux-amd64.tar.gz &&\
    chmod +x docker/docker &&\
    export COMPOSE_CLI_DIR=/usr/local/lib/docker-cli &&\
    mv ./docker /usr/local/lib/docker-cli &&\
    export DOCKER_PATH=$(which docker) &&\
    export DOCKER_DIR=$(dirname $DOCKER_PATH) &&\
    mv ${DOCKER_PATH} ${DOCKER_DIR}/com.docker.cli &&\
    ln -s ${COMPOSE_CLI_DIR}/docker ${DOCKER_PATH}
