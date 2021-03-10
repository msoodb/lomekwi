#!/bin/bash


# Check Services and ports
sudo netstat -tulpn
ps aux

# Firewall

# SElinux
sestatus                                   # Check SELinux Status Disabled/Enforcing/Permissive
getenforce                                 # Check SELinux Status
setenforce permissive                      # Disable SELinux Temporarily
semanage permissive -a httpd_t             #Temporarily Disabling SELinux for NGINX
SELINUX=disabled in /etc/sysconfig/selinux # Disable SELinux Permanently
sudo ps auZ | grep nginx                   # NGINX is labeled with the httpd_t context:
sudo ls -Zla
sudo chcon -R -t httpd_sys_content_t /path/to
sudo semanage fcontext -a -t httpd_sys_content_t '/var/www/myapp(/.*)?'
sudo restorecon -Rv /var/www/myapp/
