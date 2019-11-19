FROM alpine:3.10

MAINTAINER brande.wang@hotmail.com


COPY locale.md /locale.md

# Set the lang, you can also specify it as as environment variable through docker-compose.yml
ENV LANG=zh_CN.UTF-8 \
    LANGUAGE=zh_CN.UTF-8

#package installed
RUN apk add tzdata openssh-server ca-certificates --no-cache && \
#setup timezone
    ln -s /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \ 
#setup sshd
    sed -i "s/#PermitRootLogin.*/PermitRootLogin yes/g" /etc/ssh/sshd_config && \
    echo PubkeyAcceptedKeyTypes=+ssh-dss >> /etc/ssh/sshd_config && \
    ssh-keygen -t rsa -P "" -f /etc/ssh/ssh_host_rsa_key && \
    ssh-keygen -t ecdsa -P "" -f /etc/ssh/ssh_host_ecdsa_key && \
    ssh-keygen -t ed25519 -P "" -f /etc/ssh/ssh_host_ed25519_key && \
    mkdir -p ~/.ssh && \
    touch ~/.ssh/authorized_keys && \
#setup lang utf-8
    wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub && \
    wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.25-r0/glibc-2.25-r0.apk && \
    wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.25-r0/glibc-bin-2.25-r0.apk && \
    wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.25-r0/glibc-i18n-2.25-r0.apk && \
    apk add glibc-bin-2.25-r0.apk glibc-i18n-2.25-r0.apk glibc-2.25-r0.apk && \
	cat locale.md | xargs -i /usr/glibc-compat/bin/localedef -i {} -f UTF-8 {}.UTF-8 && \
#custom
    mkdir -p /data/logs &&\
#clean install package
	rm -rf locale.md glibc-bin-2.25-r0.apk glibc-i18n-2.25-r0.apk glibc-2.25-r0.apk /var/cache/apk/* && \
	apk del tzdata 
#setup supervisor(not necessary, about 50MB)
#    apk add supervisor && \
#    mkdir /etc/supervisor.d/ && \
#    sed -i "s/;nodaemon=false.*/nodaemon=yes/g" /etc/supervisord.conf && \

#ADD sshd.ini /etc/supervisor.d/sshd.ini

ADD entrypoint.sh entrypoint.sh


#ENTRYPOINT
ENTRYPOINT ["./entrypoint.sh"]
