FROM docker.io/brandewang/base

MAINTAINER brande.wang@hotmail.com

#yum install
RUN yum install epel-release -y

RUN yum install php-fpm php php-cli php-gd php-common php-ldap php-pdo php-pear php-snmp php-xml php-mysql php-mbstring nginx git -y

#Set env for app to connect mysql
ENV MYSQL_HOST="10.28.50.5"\
	MYSQL_USER="phpipam"\
	MYSQL_PASS="phpipamadmin"

RUN mkdir -p /data/www &&\
	git clone https://github.com/phpipam/phpipam.git /data/www/ipam &&\
	cp /data/www/ipam/config.dist.php  /data/www/ipam/config.php &&\
	sed -i \ 
	-e "s/\['host'\] = 'localhost'/\['host'\] = '$MYSQL_HOST'/" \ 
	-e "s/\['user'\] = 'phpipam'/\['user'\] = '$MYSQL_USER'/" \ 
	-e "s/\['pass'\] = 'phpipamadmin'/\['pass'\] = '$MYSQL_PASS'/" /data/www/ipam/config.php 

#Configure php timezone
RUN sed -i 's/;date.timezone =/date.timezone = UTC/g' /etc/php.ini

#Configure nginx
RUN mkdir -p /data/logs/nginx &&\
	sed -i '8a daemon off\;' /etc/nginx/nginx.conf
ADD ipam.conf /etc/nginx/conf.d/

#Configure daemon
ADD supervisord.conf /etc/supervisord.conf

EXPOSE 80
