#!/bin/bash


# Booting Process
- BIOS starts.
- POST.
- Boot loader runs [GRUB Legacy/ GRUB2]. 
- Kernel loads.
- Initializing init processes run [SysVinit / systemd].

dmesg
which init                  #/usr/sbin/init
readlink /usr/sbin/init     #../lib/systemd/systemd

# Shell Initialization Files
- System-wide startup files
/etc/profile [/etc/profile.d/*.csh]
/etc/bashrc [/etc/bash.bashrc]

- User-specific startup files
~/.bash_profile
~/.bash_login
~/.profile
~/.bashrc
~/.bash_history
~/.bash_logout

# Routine
- Interactive Login Shell
/bin/login => /etc/passwd
/etc/profile [/etc/profile.d/*.csh]
~/.bash_profile

- Interactive non-login Shell
/bin/bash
/etc/profile
/etc/profile.d/*.csh
~/.bash_profile OR ~/.bash_login OR ~/.profile
~/.bash_profile
~/.bashrc

- Non-interactive Shell

# Environment variables
env                        #exported variables
set                        #local and exported variables
echo $HOME
PI=3.14
echo $PI
export PI
export ANGEL=45
unset ANGEL
echo $PATH
set | grep PATH
env | grep PATH
PATH=$PATH:/some/dir/to #Appending
PATH=/some/dir/to:$PATH


# Stopping the system
halt
poweroff
reboot
shutdown

# Notifying the users
/etc/issue
/etc/issue.net
/etc/motd
/bin/notify-send
/bin/wall
mesg

# Repeat some command in shell
while true; do clear; tree ;sleep 1; done



