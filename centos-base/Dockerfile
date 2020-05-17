FROM centos:7.7.1908

MAINTAINER brande.wang@hotmail.com

ENV LANG en_US.utf8
#yum install
RUN yum install -y net-tools openssh-server iproute epel-release &&\
	yum install -y supervisor &&\
	yum install -y crontabs logrotate &&\
#setup timezone
	rm -rf /etc/localtime && ln -s /usr/share/zoneinfo/Asia/Shanghai /etc/localtime &&\
#add locale zh_CN.utf8 
	localedef -c -f UTF-8 -i zh_CN zh_CN.utf8 &&\
#setup sshd
    sed -i "s/#PermitRootLogin.*/PermitRootLogin yes/g" /etc/ssh/sshd_config && \
    echo PubkeyAcceptedKeyTypes=+ssh-dss >> /etc/ssh/sshd_config && \
    ssh-keygen -t rsa -P "" -f /etc/ssh/ssh_host_rsa_key && \
    ssh-keygen -t ecdsa -P "" -f /etc/ssh/ssh_host_ecdsa_key && \
    ssh-keygen -t ed25519 -P "" -f /etc/ssh/ssh_host_ed25519_key && \
    mkdir -p ~/.ssh && \
    touch ~/.ssh/authorized_keys && \
#custom
    mkdir -p /opt/logs


#ADD FILE
ADD entrypoint.sh entrypoint.sh
ADD supervisord.ini /etc/supervisord.d/supervisord.ini
ADD sshd.ini /etc/supervisord.d/sshd.ini
ADD crond.ini /etc/supervisord.d/crond.ini

#ENTRYPOINT
ENTRYPOINT ["./entrypoint.sh"]
