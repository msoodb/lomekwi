#!/bin/bash


# anonymous ftp server
sudo dnf install vsftpd
sudo systemctl start vsftpd.service
sudo systemctl enable vsftpd.service
sudo systemctl status vsftpd.service
firewall-cmd --zone=public --permanent --add-port=21/tcp
firewall-cmd --zone=public --permanent --add-service=ftp
firewall-cmd --add-service=ftp --perm
firewall-cmd --add-port=40000-40001/tcp --perm
firewall-cmd --reload
sudo cp /etc/vsftpd/vsftpd.conf /etc/vsftpd/vsftpd.conf.orig
sudo emacs /etc/vsftpd/vsftpd.conf
anonymous_enable=YES
local_enable=NO
write_enable=NO
/var/ftp/pub

# connect to ftp server
ftp ftp.sunet.se
user: anonymous
password:
