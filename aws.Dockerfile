ARG BASE_IMAGE=paris/compose-cli:19.03.13
FROM ${BASE_IMAGE}

RUN apk add py-pip
RUN pip install awscli==1.18.142
