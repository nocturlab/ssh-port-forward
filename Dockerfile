FROM alpine

ENV WORK_PATH /app

WORKDIR $WORK_PATH

RUN apk update && apk add openssh && apk add autossh

ARG SSH_KEY
ENV SSH_KEY ${SSH_KEY:-invalid}

ARG REMOTE_USER
ENV REMOTE_USER ${REMOTE_USER:-root}

ARG REMOTE_HOST
ENV REMOTE_HOST ${REMOTE_HOST:-localhost}

ARG SSH_PORT
ENV SSH_PORT ${SSH_PORT:-22}

ARG PORT
ENV PORT ${PORT:-localhost:22}

ARG REMOTE_PORT
ENV REMOTE_PORT ${REMOTE_PORT:-2222}

COPY ./entrypoint.sh ./entrypoint.sh
RUN chmod +x ./entrypoint.sh

ENTRYPOINT './entrypoint.sh'
