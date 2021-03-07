#!/bin/bash


# A mail server (sometimes called MTA – Mail Transport Agent) is an application that
# is used to transfer mails from one user to another.
# Postfix was designed to be easier to configure as well as more reliable and secure than sendmail,
# and it has become the default mail server on many Linux distributions (e.g. openSUSE).
# mail server ...

 ------------------
|  MDA | MTA | MUA |
 ------------------     

# Check if postfix already on the system
rpm -qa | grep postfix

# MTA: Install and start Postfix
sudo dnf install postfix
sudo systemctl start postfix.service
sudo systemctl enable postfix.service
sudo systemctl status postfix.service

# MTA: Configure Postfix
/etc/postfix/main.cf
myhostname = mail.maangrui.xyz
mydomain = maangrui.xyz
myorigin = $myhostname
mydestination = $myhostname, localhost.$mydomain, localhost, mail.$mydomain, www.$mydomain
mail_spool_directory = /var/spool/mail
mynetworks = 127.0.0.0/8, 192.168.1.0/24
smtpd_banner = $myhostname ESMTP $mail_name
inet_interfaces = $myhostname, localhost
inet_protocols = ipv4

# MTA: Reload Postfix	      
sudo systemctl reload postfix.service
sudo postfix check

# MTA: Checking the Mail Queue
mailq
postfix flush

# Connect to mail server via port 25
telnet 207.154.212.102 25
