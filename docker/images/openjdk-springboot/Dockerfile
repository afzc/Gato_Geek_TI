FROM openjdk:13-jdk-alpine3.10

LABEL version=1.0.1
LABEL description="simple GET 8080:/hello/{name} java springboot using openjdk:13-jdk-alpine3.10"
LABEL vendor="Alan F ZC"

ENV init init.sh
ENV execpath /usr/src/myapp
ENV jav app_1.0.1.jar
ENV puerto 8080

#VOLUME /tmp

WORKDIR $execpath

#RUN fallocate -l 50M root.txt

RUN apk add --update curl && \
    rm -rf /var/cache/apk/*

COPY $jav .
COPY $init .

EXPOSE $puerto

CMD sh $init
