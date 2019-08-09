FROM brandewang/alpine-base

MAINTAINER brande.wang@hotmail.com

ADD jdk1.8.0_60.tar.gz /opt/
ADD sgerrand.rsa.pub /etc/apk/keys/sgerrand.rsa.pub
COPY glibc-2.28-r0.apk /opt/glibc-2.28-r0.apk

RUN ln -s /opt/jdk1.8.0_60 /opt/jdk && \
    apk add /opt/glibc-2.28-r0.apk

ENV JAVA_HOME /opt/jdk
ENV JRE_HOME /opt/jdk/jre
ENV PATH $JAVA_HOME/bin:$PATH
ENV CLASSPATH .:${JAVA_HOME}/lib:${JRE_HOME}/lib
