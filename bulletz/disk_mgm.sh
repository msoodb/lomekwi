#!/bin/bash

# Design hard disk layout
#----------------------------------------------#
# MBR
# Maximum 4 Primary partition
# Maximum 1 Extended partition
# Logical partition in Extended partition
#----------------------------------------------#

# Server with 512 GB HDD, 8 GB RAM NO-LVM parition layout
1    /dev/sdx1    Primary   200 MB  /boot      Linux    ext4
2    /dev/sdx2    Primary    40 GB  /          Linux    ext4
3    /dev/sdx3    Primary     8 GB  swap       Linux    swap / Solaris
4    /dev/sdx4    Extended  460 GB              
5    /dev/sdx5    Logical   100 GB  /var       Linux    ext4
6    /dev/sdx6    Logical    10 GB  /usr       Linux    ext4
7    /dev/sdx7    Logical   350 GB  /home      Linux    ext4

# Disks
/dev/sdx, /dev/sdy, ...

# Disk partitioning
sudo fdisk /dev/sdx
sudo parted /dev/sdx


# View partitions
lsblk -f

# Disk formatting
sudo mkfs.ext4 /dev/sdx1


# Mount USB Drive on Linux
                                  #Plug-in your USB drive to your PC
lsblk -f                          #Detecting the USB Drive on PC
sudo mount /dev/sdx1 /mnt/        #Create a Mount Point
sudo umount /dev/sdx1             #Un-mount the USB
udisksctl mount -b /dev/sdx1      #Without roor permission


# Fill /dev/sdb with zero
sudo dd if=/dev/zero of=/dev/sdx status=progress

# Create a bootable USB
sudo dd if=artful-desktop-amd64.iso of=/dev/sdx bs=1M status=progress



# Some usefull command
df -h
sudo parted -ls
lsblk -f
lsblk -m
ls -ld /run/media/masoud
cat /etc/fstab
cat /etc/mtab

# USB drive auto-mounted by user but gets write permissions for root only
# A possible reason could be that you formatted/created the storage disk
# with a tool with root privilege and so the file-system created was owned by the root.

[...]$ ls -ld /run/media/masoud/cb2b9459-96fe-420f-a4f3-65e3393eb748/
drwxr-xr-x 3 root root 4096 Sep 18 13:27 /run/media/masoud/cb2b9459-96fe-420f-a4f3-65e3393eb748/

[...]$ sudo chown masoud:masoud -R /run/media/masoud/cb2b9459-96fe-420f-a4f3-65e3393eb748/


# Server LVM parition layout
...
...
