FROM openjdk:8-jdk-alpine

MAINTAINER brande.wang@hotmail.com

LABEL version="8-jdk-alpine"

ENV LANG=en_US.UTF-8

RUN apk add tzdata &&\
		cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime &&\
		echo "Asia/Shanghai" > /etc/timezone &&\
		apk del tzdata 
