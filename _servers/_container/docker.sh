#!/bin/bash


"'https://docs.docker.com/docker-hub/access-tokens/
  https://docs.docker.com/docker-hub/repos/ '"

# Install podman
sudo dnf install podman

# Login with docker account
podman login --username msoodb #9d682d5d-f20f-4011-98d4-32abbf636d77

# Trying basic podman commands
podman pull registry.access.redhat.com/rhel7/rhel
podman images
podman run -it registry.access.redhat.com/rhel7/rhel /bin/bash
postman ps -a
podman rm 440becd26893
podman rmi docker.io/library/hello-world


##########################################################
# OS requirements
# -Fedora 30 64-bit
# -Fedora 31 64-bit

# Uninstall old versions
sudo dnf remove docker \
     docker-client \
     docker-client-latest \
     docker-common \
     docker-latest \
     docker-latest-logrotate \
     docker-logrotate \
     docker-selinux \
     docker-engine-selinux \
     docker-engine

# images, containers, volumes, and networks.
# /var/lib/docker/

# Set up the repository
sudo dnf -y install dnf-plugins-core
sudo dnf config-manager \
     --add-repo \
     https://download.docker.com/linux/fedora/docker-ce.repo

# Install
sudo dnf install docker-ce docker-ce-cli containerd.io

# Manage docker service
sudo systemctl start docker.service
sudo systemctl enable docker.service
sudo systemctl status docker.service

# Run hello-world
sudo docker run hello-world

