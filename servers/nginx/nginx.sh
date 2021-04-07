#!/bin/bash


# http server nginx
sudo dnf install nginx

/etc/nginx/nginx.conf

sudo mkdir /etc/nginx/sites-available/
sudo mkdir /etc/nginx/sites-enabled/

/etc/nginx/sites-available/maangrui.conf
/etc/nginx/sites-available/api.maangrui.conf

cd /etc/nginx/sites-enabled/
sudo ln -s ../sites-available/maangrui.conf .
sudo ln -s ../sites-available/api.maangrui.conf .

#configuration file /etc/nginx/nginx.conf test is successful
sudo nginx -t

sudo systemctl start nginx.service
sudo systemctl enable nginx.service

# Publish /var/www
sudo mkdir /var/www
sudo chmod -R 755 /var/www
sudo mkdir /var/www/maangrui.xyz
sudo chown -R $USER:$USER /var/www/maangrui.xyz/
scp -i ~/.ssh/id_rsa_personal -r *  samoor@207.154.212.102:/var/www/maangrui.xyz # from development


# SELinux
getenforce
sudo chcon -Rt httpd_sys_content_t /var/www/maangrui.xyz/
sudo setsebool httpd_can_network_connect on

# https via certbot
sudo dnf install certbot python-certbot-nginx
sudo certbot --nginx
