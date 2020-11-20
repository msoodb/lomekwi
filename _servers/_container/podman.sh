#!/bin/bash


"'https://docs.docker.com/docker-hub/access-tokens/
  https://docs.docker.com/docker-hub/repos/ '"

# Install podman
sudo dnf install podman

# Login with docker account
podman login --username msoodb #9d682d5d-f20f-4011-98d4-32abbf636d77
podman login docker.io

# Basic podman commands
podman pull registry.access.redhat.com/rhel7/rhel
podman images
podman run -it registry.access.redhat.com/rhel7/rhel /bin/bash
podman ps -a
podman rm 440becd26893
podman rmi docker.io/library/hello-world
podman start docker.io/library/hello-world
podman inspect <image>
podman logs <container_ID>

# Create a Dockerfile
cd ~/Projects/api.monavis
touch Dockerfile

# Build image
podman build -t api.monavis .

# Run image
podman run -d \
       -it \
       --name api.monavis-app \
       --restart unless-stopped \
       -v "$(pwd)"/app:/app:Z \
       -p5000:5000 \
       api.monavis
