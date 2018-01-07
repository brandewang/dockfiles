FROM docker.io/brandewang/nginx

MAINTAINER brande.wang@hotmail.com

#yum install repo
RUN yum install epel-release -y

#yum install dependency
RUN yum install git python2-pip libvirt-devel libvirt-python -y

#install webvirtmgr
RUN cd /data &&\
git clone git://github.com/retspen/webvirtmgr.git &&\
cd /data/webvirtmgr && pip install -r requirements.txt &&\
./manage.py syncdb --noinput &&\
./manage.py collectstatic --noinput &&\
mkdir /root/.ssh &&\
sed -i '34c StrictHostKeyChecking no' /etc/ssh/ssh_config &&\
pip install websockify

#ADD config file
ADD webvirtmgr.conf /etc/nginx/conf.d/
ADD webvirtmgrd.conf /etc/supervisord.d/
ADD id_dsa /root/.ssh/
RUN chmod 600 /root/.ssh/id_dsa

EXPOSE 6080 8080
