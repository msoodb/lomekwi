#!/bin/bash

""" Install Sfce and go to graphical.target """
systemctl get-default
ls -l /etc/systemd/system/default.target
systemctl set-default graphical.target
reboot

""" ssh to server with user pass and change ssh port """
# Step 1: Backup Current SSH configuration
date_format=`date +%Y_%m_%d:%H:%M:%S`
sudo cp /etc/ssh/sshd_config /etc/ssh/sshd_config_$date_format

# Step 2: Change SSH service port
vi /etc/ssh/sshd_config : change  Port 22 to Port 33000

# Step 3: Allow new SSH port on SELinux
semanage port -l | grep ssh
semanage port -a -t ssh_port_t -p tcp 33000
semanage port -l | grep ssh

# Step 4: Open SSH port on Firewalld
firewall-cmd --add-port=33000/tcp --permanent
firewall-cmd --reload
firewall-cmd --remove-service=ssh --permanent
firewall-cmd --reload

# Step 5: Restart sshd service
systemctl restart sshd
netstat -tunl | grep 33000

# test
ssh root@<host_ip> -p33000

""" ssh to srver with root update and install required package """
#ssh-copy-id -i ~/.ssh/<public_rsa_key> root@<host_ip>
#ssh -i ~/.ssh/<private_rsa_key> root@<host_ip>
ssh root@<host_ip> -p33000
cat /etc/os-release
dnf update
dnf install emacs
dnf install bash-completion

""" localization """
sudo hwclock
timedatectl
sudo systemctl status chronyd.service
/etc/chrony.conf
/etc/chrony.keys

""" Network Configuration ip, subnet mask, default router, dns server, hostname """
cat /etc/sysconfig/network-scripts/ifcfg-eth0
cat /etc/resolv.conf
cat /etc/hostname
cat /etc/hosts
ip addr show
hostnamectl

""" add user and make it sudoer """
useradd <samoor>
passwd <samoor>
usermod -aG wheel <samoor>

exit from server to client.
""" prepare server to make <samoor> do ssh to server """
ssh-copy-id -i ~/.ssh/<public_rsa_key> <samoor>@<host_ip> -p33000
#su <samoor>
#mkdir ~/.ssh
#cp /root/.ssh/authorized_keys /home/samoor/.ssh/authorized_keys # with root user
#sudo chown samoor:samoor authorized_keys
#chmod 700 ~/.ssh
#chmod 600 ~/.ssh/authorized_keys
#sudo systemctl restart sshd
ssh -i ~/.ssh/<public_rsa_key> <samoor>@<host_ip> -p33000 # ssh -X -i ~/.ssh/<public_rsa_key> samoor@<host_ip>

""" turn off ssh access for root """
# sudo emacs /etc/ssh/sshd_config
# set PermitRootLogin no
# sudo systemctl restsrt sshd

""" manage repos  /etc/yum.repo.d """
dnf config-manager --add-repo /etc/yum.repos.d/fedora_extras.repo
dnf config-manager --set-enabled fedora-extras
dnf config-manager --set-disabled fedora-extras

""" copy file to server """
scp -i ~/.ssh/id_rsa_personal -r bin/backup/  samoor@207.154.212.102:~/bin

""" copy file from server """
scp -i ~/.ssh/id_rsa_personal -r samoor@207.154.212.102:/etc/nginx/sites-available .


""" install xfce-gui """
# 1
sudo dnf -y group install "Xfce Desktop"
echo "exec /usr/bin/xfce4-session" >> ~/.xinitrc
startx # Only in panel with text user. not with ssh user!

# 2
sudo dnf install @xfce-desktop-environment
echo "exec startxfce4" >> ~/.xinitrc
startx


""" 
vnc 
The default port of VNC server is 5900. To reach the port through which a remote desktop will be accessible, 
sum the default port and the user’s assigned display number. For example, for the second port: 2 + 5900 = 5902.
https://docs.fedoraproject.org/en-US/fedora/rawhide/system-administrators-guide/infrastructure-services/TigerVNC/
"""

# vnc server
sudo dnf install tigervnc-server
#sudo cp /lib/systemd/system/vncserver@.service /etc/systemd/system/vncserver@.service
#sudo emacs /etc/systemd/system/vncserver@.service
# ExecStart=/sbin/runuser -l masoud -c "/usr/bin/vncserver %i -geometry 1280x1024"
# PIDFile=/home/masoud/.vnc/%H%i.pid
#sudo systemctl daemon-reload
#systemctl start vncserver@:1.service
#Add a user mapping to /etc/tigervnc/vncserver.users

Edit .vnc/xstartup
#exec /etc/X11/xinit/xinitrc
exec /usr/bin/xfce4-session
exec startx

sudo firewall-cmd --add-service=vnc-server --permanent
sudo firewall-cmd --zone=public --add-port=5900-5905/tcp
firewall-cmd --zone=public --list-ports
sudo firewall-cmd --reload
vncpasswd
 Password:
 Verify:
vncserver
vncserver -kill :1

# vnc client
""" VNC is a clear text network protocol with no security against possible attacks on the communication """
sudo dnf install tigervnc-server
ssh -i ~/.ssh/id_rsa_personal -t -L 5901:localhost:5901 masoud@45.32.233.138 -p33000
vncviewer localhost:1
