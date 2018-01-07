FROM centos:7

MAINTAINER brande.wang@hotmail.com

#yum install
RUN yum install -y net-tools wget unzip vim openssh openssh-server openssh-clients make gcc patch

#install setuptools
RUN cd /usr/local/src \
	&& wget https://pypi.python.org/packages/69/56/f0f52281b5175e3d9ca8623dadbc3b684e66350ea9e0006736194b265e99/setuptools-38.2.4.zip \
	&& unzip setuptools-38.2.4.zip \
	&& cd setuptools-38.2.4 \
	&& python setup.py install \
	&& rm -rf /usr/local/src/setuptools-38.2.4*

#install supervisor
RUN cd /usr/local/src \
	&& wget https://pypi.python.org/packages/31/7e/788fc6566211e77c395ea272058eb71299c65cc5e55b6214d479c6c2ec9a/supervisor-3.3.3.tar.gz \
	&& tar zxvf supervisor-3.3.3.tar.gz \
	&& cd supervisor-3.3.3 \
	&& python setup.py install \
	&& rm -rf /usr/local/src/supervisor-3.3.3* \
	&& mkdir /etc/supervisord.d
	
#sshd key config
RUN ssh-keygen -q -t rsa -b 2048 -f /etc/ssh/ssh_host_rsa_key -N ''
RUN ssh-keygen -q -t ecdsa -f /etc/ssh/ssh_host_ecdsa_key -N ''
RUN ssh-keygen -t dsa -f /etc/ssh/ssh_host_ed25519_key  -N ''




#修改时区
RUN rm -rf /etc/localtime && ln -s /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

#中文
RUN localedef -c -f UTF-8 -i zh_CN zh_CN.utf8
ENV LC_ALL zh_CN.utf8
#ADD FILE
ADD limits.conf /etc/security/limits.conf
ADD supervisord.conf /etc/supervisord.conf

#CMD on boot
CMD ["/usr/bin/supervisord"]
