FROM python:3.8.2-alpine3.11

ENV LANG C.UTF-8

ARG PACLAIR_VERSION=3.2.0

RUN apk update && \
    apk upgrade && \
    apk add --no-cache \
        git \
        nodejs \
        npm

RUN pip install --no-cache-dir paclair==$PACLAIR_VERSION boto3

RUN npm install codefresh -g

COPY script/paclair.py /paclair.py

ENTRYPOINT ["python", "/paclair.py"]
CMD ["scan"]