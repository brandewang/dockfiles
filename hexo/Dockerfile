FROM docker.io/brandewang/base

MAINTAINER brande.wang@hotmail.com

#yum install dependency
RUN yum install epel-release -y
RUN yum install git -y

#Install Node.js
RUN wget -qO- https://raw.github.com/creationix/nvm/master/install.sh | sh &&\
source ~/.bashrc &&\
nvm install stable &&\
npm install -g hexo-cli &&\

#hexo build site
hexo init /data/hexo &&\
cd /data/hexo &&\
npm install &&\
ln -s /root/.nvm/versions/node/*/bin/hexo /usr/local/bin/hexo &&\
ln -s /root/.nvm/versions/node/*/bin/node /usr/local/bin/node


#Configure daemon
ADD hexod.conf /etc/supervisord.d/

EXPOSE 4000
VOLUME ["/data/hexo/source/_posts/",]

