FROM openjdk:15-jdk-alpine3.11

LABEL version=0.0.0
LABEL description="Image openjdk for hello world"
LABEL vendor="Alan F ZC"

ENV init init.sh
ENV execpath /usr/src/myapp
ENV jav app.class
ENV puerto 8081

WORKDIR $execpath

COPY $jav .
COPY $init .

VOLUME $execpath

EXPOSE $puerto

CMD sh $init
