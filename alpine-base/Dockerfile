FROM alpine:3.10

MAINTAINER brande.wang@hotmail.com

#package installed
RUN apk add tzdata openssh-server --no-cache && \
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
#setup supervisor(not necessary, about 50MB)
#    apk add supervisor && \
#    mkdir /etc/supervisor.d/ && \
#    sed -i "s/;nodaemon=false.*/nodaemon=yes/g" /etc/supervisord.conf && \
#custom
    mkdir -p /data/logs

#ADD sshd.ini /etc/supervisor.d/sshd.ini
ADD entrypoint.sh entrypoint.sh


#ENTRYPOINT
ENTRYPOINT ["./entrypoint.sh"]
