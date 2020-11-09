
# Managing Services and Daemons
#----------------------------------------------#

# systemd
systemctl daemon-reload
systemctl status httpd.service
systemctl stop httpd.service
systemctl start httpd.service
systemctl reload httpd.service
systemctl restart httpd.service
systemctl enable httpd.service
systemctl disable httpd.service

# service
service httpd.service status

# depricated
init.d


journalctl
journalctl --list-boots
journalctl -u httpd.service

#  web service use case
#----------------------------------------------#

dnf list installed | grep httpd
dnf install httpd -y     
dnf update httpd -y
systemctl start httpd.service
systemctl enable httpd.service
ps -up <process number>
netstat -tulpn
nc -v localhost 80


#  server monitoring use case
#----------------------------------------------#

systemctl is-active httpd.service
systemctl is-enabled httpd.service
systemctl list-units --type=service
systemctl list-units --type=service | grep service | wc -l
systemctl list-units --type=service --all
systemctl list-unit-files --type=service
systemctl list-unit-files --type=service | grep httpd
systemctl list-dependencies service.httpd
systemctl show httpd.service
systemctl --failed --type=service


#  server monitoring use case
#----------------------------------------------#     

systemctl status cups.service
systemctl mask NetworkManager.service
systemctl unmask NetworkManager.service
