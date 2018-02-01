FROM docker.io/brandewang/nginx

MAINTAINER brande.wang@hotmail.com

#yum install dependency
RUN yum install	gd gd-devel libxml2 libxml2-devel -y

#install php5.6.32
RUN cd /usr/local/src &&\
wget http://cn2.php.net/distributions/php-5.6.32.tar.gz &&\
tar zxvf php-5.6.32.tar.gz &&\
cd /usr/local/src/php-5.6.32 &&\
./configure --prefix=/usr/local/php --with-mysql=mysqlnd --enable-mysqlnd --with-gd --enable-gd-native-ttf --enable-gd-jis-conv --enable-fpm --enable-bcmath  --enable-mbstring --enable-sockets -with-jpeg-dir --with-freetype-dir --with-mysqli&&\
make && make install &&\
cp /usr/local/php/etc/php-fpm.conf.default /usr/local/php/etc/php-fpm.conf &&\
cp /usr/local/src/php-5.6.32/php.ini-production /usr/local/php/lib/php.ini &&\
sed -i 's/;date.timezone =/date.timezone = PRC/' /usr/local/php/lib/php.ini


#Configure daemon
ADD php-fpm.conf /etc/supervisord.d

