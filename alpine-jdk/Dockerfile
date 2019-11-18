FROM brandewang/alpine-base-utf8

MAINTAINER brande.wang@hotmail.com

ADD jdk1.8.0_60.tar.gz /opt/

RUN ln -s /opt/jdk1.8.0_60 /opt/jdk 

ENV JAVA_HOME opt/jdk  
ENV JRE_HOME=/opt/jdk/jre 
ENV PATH="$JAVA_HOME/bin:$PATH" 
ENV CLASSPATH=.:${JAVA_HOME}/lib:${JRE_HOME}/lib
