#!/bin/bash


# ssh to srver with root update and install required packages
ssh -i ~/.ssh/<private_rsa_key> root@<host_ip>
cat /etc/os-release
dnf update
dnf install emacs
dnf install bash-completion

# localization
sudo hwclock
timedatectl
sudo systemctl status chronyd.service
/etc/chrony.conf
/etc/chrony.keys

# Network Configuration ip, subnet mask, default router, dns server, hostname
cat /etc/sysconfig/network-scripts/ifcfg-eth0
cat /etc/resolv.conf
cat /etc/hostname
cat /etc/hosts
ip addr show
hostnamectl

# add user and make it sudoer
useradd <samoor>
passwd <samoor>
usermod -aG wheel <samoor>

# prepare server to make <samoor> do ssh to server
su <samoor>
mkdir ~/.ssh
cp /root/.ssh/authorized_keys /home/samoor/.ssh/authorized_keys # with root user
chmod 700 ~/.ssh
chmod 600 ~/.ssh/authorized_keys
sudo systemctl restart sshd
ssh -i ~/.ssh/<public_rsa_key> samoor@<host_ip>

# turn off ssh access for root 
sudo emacs /etc/ssh/sshd_config
set PermitRootLogin no
sudo systemctl restsrt sshd

# manage repos  /etc/yum.repo.d
dnf config-manager --add-repo /etc/yum.repos.d/fedora_extras.repo
dnf config-manager --set-enabled fedora-extras
dnf config-manager --set-disabled fedora-extras

# copy file to server
scp -i ~/.ssh/id_rsa_personal -r bin/backup/  samoor@207.154.212.102:~/bin

