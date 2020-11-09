# Docker is a platform for developers and sysadmins to develop, 
# ship, and run applications inside software containers
sudo dnf install docker
sudo groupadd docker && sudo gpasswd -a ${USER} docker && sudo systemctl restart docker
newgrp docker

sudo systemctl status docker
sudo systemctl start docker
sudo systemctl enable docker
sudo systemctl restart docker

sudo docker images
sudo docker search nginx
sudo docker pull nginx
sudo docker run hello-world


# Compose is a tool for defining and running multi-container Docker applications
sudo dnf install docker-compose

sudo docker-compose up
sudo docker-compose down

# Disable SELinux Permanently
sestatus
vi /etc/sysconfig/selinux
SELINUX=disabled
reboot
