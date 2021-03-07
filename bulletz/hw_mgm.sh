#!/bin/bash

# Determine and configure hardware settings
#----------------------------------------------#

# Boot
UEFI



# HAL     ----> /sys
# Kernel  ----> /proc
# Udev    ----> /dev

/proc/cpuinfo     #Lists detailed information about the CPU(s) found by the operating system.
/proc/interrupts  #List of numbers of the interrupts per IO device for each CPU.
/proc/ioports     #Lists currently registered Input/Output port regions in use.
/proc/dma         #Lists the registered DMA (direct memory access) channels in use.

/etc/udev/rules.d      #Udev rules

lspci                  #Determine hardware
lsusb
lsdev
lshw
lspci -s 04:02.0 -v    #Hardware detail
lsusb -v -d 1781:0c9f
lsusb -t
lsblk

/lib/modules/5.6.13-100.fc30.x86_64/kernel/drivers      #Kernel modules
lsmod                                                   #Kernel modules
modinfo ath10k_pci                                      #Kernel module detail
/etc/modprobe.d/*.conf                                  #Module configuration folder


# Determine and unloadnig wireless network adapter
lspci                        #id of wireless network 02:00.0
lspci -s 02:00.0 -k          #Kernel modules: ath10k_pci
sudo modprobe -r ath10k_pci  #Unloading module
sudo modprobe ath10k_pci     #Loading ...


# Find UUID of Storage Devices
blkid
ll /dev/disk/by-uuid
lsblk -f

# Specific file systems and mount them automatically via UUID
/etc/fstab










