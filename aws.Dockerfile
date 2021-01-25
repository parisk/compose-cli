FROM paris/compose-cli:19.03.13

RUN apk add py-pip
RUN pip install awscli==1.18.142
