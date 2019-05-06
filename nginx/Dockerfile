FROM docker.io/brandewang/base

MAINTAINER brande.wang@hotmail.com

#yum install dependency
RUN yum install epel-release -y
RUN yum install pcre pcre-devel openssl openssl-devel zlib-devel perl-ExtUtils-Embed  -y


#ADD tar packages 
ADD nginx-1.12.2.tar.gz	/usr/local/src/
ADD nginx_upstream_check_module.tar.gz	/usr/local/src/

#INSTALL
RUN	cd /usr/local/src/nginx-1.12.2 &&\
	patch -p1 < ../nginx_upstream_check_module/check_1.12.1+.patch &&\
	mkdir -p /var/lib/nginx/tmp/client_body &&\
	./configure	--prefix=/usr/local/nginx --sbin-path=/usr/local/nginx/sbin/nginx --conf-path=/etc/nginx/nginx.conf --error-log-path=/data/logs/nginx/error.log --http-log-path=/data/logs/nginx/access.log --pid-path=/var/run/nginx.pid --http-client-body-temp-path=/var/lib/nginx/tmp/client_body --http-proxy-temp-path=/var/lib/nginx/tmp/proxy --http-fastcgi-temp-path=/var/lib/nginx/tmp/fastcgi --pid-path=/var/run/nginx.pid --lock-path=/var/lock/subsys/nginx --with-http_ssl_module --with-http_realip_module --with-http_addition_module --with-http_sub_module --with-http_dav_module --with-http_flv_module --with-http_gzip_static_module --with-http_stub_status_module --with-mail --with-mail_ssl_module --with-openssl-opt=enable-tlsext --with-http_perl_module --with-stream --with-pcre --add-module=/usr/local/src/nginx_upstream_check_module &&\
	make && make install &&\
	ln -s /usr/local/nginx/sbin/nginx /usr/bin/nginx &&\
	mkdir /etc/nginx/conf.d && mkdir /etc/nginx/iplist

#set vim syntax for nginx
RUN cd  /usr/share/vim/vim74/syntax &&\
	wget --timeout=20 -O nginx.vim https://vim.sourceforge.io/scripts/download_script.php?src_id=19394 &&\
	echo 'au BufRead,BufNewFile /etc/nginx/*,/usr/local/nginx/conf/*  set ft=nginx' >> /usr/share/vim/vim74/filetype.vim

#Configure daemon
ADD nginxd.conf /etc/supervisord.d/

EXPOSE 80 8080 1111
