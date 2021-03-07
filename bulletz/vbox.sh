#!/bin/bash


# Virtualization
hypervisor [type1 / type2]
-Type 2: Virtualbox, VMware
-Type 1: KVM, Xen, Hyper-V
virtual machine (VM)

# Containers
docker
-Application Containers
-Operating System Containers




# Virtualbox
Enable virtualization using BIOS setup
cd /etc/yum.repos.d/
sudo wget http://download.virtualbox.org/virtualbox/rpm/fedora/virtualbox.repo
sudo dnf search virtualbox
sudo dnf install VirtualBox-6.1
sudo usermod -aG vboxusers $USER
virtualbox
