FROM docker.io/brandewang/base

MAINTAINER brande.wang@hotmail.com

#install yum repo
RUN curl https://packages.gitlab.com/install/repositories/gitlab/gitlab-ce/script.rpm.sh |bash

#yum install dependency
RUN yum install gitlab-ce-10.0.3 postfix -y

#Configure daemon
ADD gitlab.conf /etc/supervisord.d/
