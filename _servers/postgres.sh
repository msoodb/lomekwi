#!/bin/bash


# http server nginx
sudo dnf install nginx

# /etc/nginx/nginx.conf
user		   nginx;
worker_processes   auto;
error_log 	   /var/log/nginx/error.log;
pid 		   /run/nginx.pid;

include 	   /usr/share/nginx/modules/*.conf;

events {
    worker_connections 1024;
}

http {
    log_format  main  '$remote_addr - $remote_user [$time_local] "$request" '
                      '$status $body_bytes_sent "$http_referer" '
                      '"$http_user_agent" "$http_x_forwarded_for"';

    access_log          /var/log/nginx/access.log  main;

    sendfile            on;
    tcp_nopush          on;
    tcp_nodelay         on;
    keepalive_timeout   65;
    types_hash_max_size 4096;

    include             /etc/nginx/mime.types;
    default_type        application/octet-stream;
    include 		/etc/nginx/conf.d/*.conf;

    include 		/etc/nginx/sites-enabled/*.conf;
}
sudo mkdir /etc/nginx/sites-available/
sudo mkdir /etc/nginx/sites-enabled/

# /etc/nginx/sites-available/default.conf
server
{
       listen 80 default_server;
       server_name _;
       return 444;
}

# /etc/nginx/sites-available/maangrui.conf
server {
        listen       80;
        server_name  maangrui.xyz www.maangrui.xyz;
        root         /var/www/maangrui.xyz;

        error_page 404 /404.html;
            location = /40x.html {
        }

        error_page 500 502 503 504 /50x.html;
            location = /50x.html {
        }
}

cd /etc/nginx/sites-enabled/
sudo ln -s ../sites-available/default.conf .
sudo ln -s ../sites-available/maangrui.conf .

sudo systemctl start nginx.service
sudo systemctl enable nginx.service

sudo mkdir /var/www
sudo chmod -R 755 /var/www
sudo mkdir /var/www/maangrui.xyz
sudo chown -R $USER:$USER /var/www/maangrui.xyz/
scp -i ~/.ssh/id_rsa_personal -r *  samoor@207.154.212.102:/var/www/maangrui.xyz # from development

getenforce                    # Enforcing
sudo chcon -Rt httpd_sys_content_t /var/www/maangrui.xyz/
