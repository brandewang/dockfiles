FROM brandewang/centos-base:latest

MAINTAINER brande.wang@hotmail.com

ADD nginx_upstream_check_module.tar.gz /usr/local/src/

#install nginx
RUN yum install make gcc patch -y &&\
	yum install GeoIP-devel libxml2-devel libxslt-devel gd-devel pcre-devel openssl-devel zlib-devel perl-ExtUtils-Embed  -y &&\
	groupadd -r nginx &&\
	useradd -r -g nginx -M nginx &&\
	mkdir -p /var/cache/nginx/ &&\
	cd /usr/local/src &&\
	curl -O http://nginx.org/download/nginx-1.12.2.tar.gz &&\
	tar zxvf nginx-1.12.2.tar.gz &&\
	cd /usr/local/src/nginx-1.12.2 &&\
	patch -p1 < ../nginx_upstream_check_module/check_1.12.1+.patch &&\
	./configure --prefix=/opt/nginx --sbin-path=/usr/sbin/nginx --modules-path=/usr/lib/nginx/modules \
				--conf-path=/opt/nginx/etc/nginx.conf --error-log-path=/opt/logs/nginx/error.log --http-log-path=/opt/logs/nginx/access.log \
				--pid-path=/var/run/nginx.pid --lock-path=/var/run/nginx.lock \
				--http-client-body-temp-path=/var/cache/nginx/client_temp --http-proxy-temp-path=/var/cache/nginx/proxy_temp \
				--http-fastcgi-temp-path=/var/cache/nginx/fastcgi_temp --http-uwsgi-temp-path=/var/cache/nginx/uwsgi_temp \
				--http-scgi-temp-path=/var/cache/nginx/scgi_temp \
				--user=nginx --group=nginx \
				--with-http_ssl_module --with-http_realip_module --with-http_addition_module --with-http_sub_module --with-http_dav_module --with-http_flv_module --with-http_mp4_module --with-http_gunzip_module --with-http_gzip_static_module --with-http_random_index_module --with-http_secure_link_module --with-http_stub_status_module --with-http_auth_request_module --with-http_xslt_module=dynamic --with-http_image_filter_module=dynamic --with-http_geoip_module=dynamic --with-http_perl_module=dynamic --with-threads --with-stream --with-stream_ssl_module --with-stream_ssl_preread_module --with-stream_realip_module --with-stream_geoip_module=dynamic --with-http_slice_module --with-mail --with-mail_ssl_module --with-compat --with-file-aio --with-http_v2_module --with-pcre --add-module=/usr/local/src/nginx_upstream_check_module &&\
	make && make install &&\
	cd / &&\
	rm -rf /usr/local/src/* &&\
	yum remove make gcc patch -y 
		
ADD nginx.ini /etc/supervisord.d/nginx.ini

EXPOSE 80 8080 1111

#entrypoint
ENTRYPOINT ["./entrypoint.sh"]
