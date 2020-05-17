``` bash

#docker run command
#!/bin/bash

docker run -idt --name ngx \
        -p 80:80 -p 1111:1111 -p 8080:8080 \
        -v /opt/ngx/logs/:/data/logs/nginx \
        -v /opt/ngx/etc/:/opt/nginx/etc/ brandewang/centos-nginx

```
