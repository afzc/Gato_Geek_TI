FROM ubuntu:20.04

LABEL version=1.0.0
LABEL description="ubuntu 20.04 with k0s running"
LABEL vendor="Alan F ZC"

RUN apt update && \
    apt install curl -y

RUN curl -sSLf http://k0s.sh | sh