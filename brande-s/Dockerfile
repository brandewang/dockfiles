FROM harbor.corp.gihtg.com/base/openjdk:8-jdk-alpine

MAINTAINER brande.wang@hotmail.com

ADD brande-s.jar brande-s.jar

ADD entrypoint.sh entrypoint.sh

ENV JAVA_ARGS="-Xmx1000m"

ENTRYPOINT ["./entrypoint.sh"]
