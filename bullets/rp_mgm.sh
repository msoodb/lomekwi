#!/bin/bash

# rpm type
<PACKAGE-NAME>-<VERSION-RELEASE>.<ARCHITECTURE>.rpm

# rpm 
rpm -qa
rpm -qi emacs
rpm -q --whatprovides /usr/bin/emacs
rpm -V emacs
rpm -i bzr-2.7.0-23.fc30.x86_64.rpm
rpm -i *.rpm
rpm -e bzr

# Create a Backup list of all installed software on a RHEL/Fedora/Suse/CentOS Linux
rpm -qa --qf "%{NAME}\n" | sort > ~/Backup/installed-packages.log

# Restoring packages on rpm based distro
LIST="$( cat ~/Backup/installed-packages.log )"

for s in $LIST; do  echo $s; done

# yum
/etc/yum.repos.d/*.repo
yum install emacs
yum reinstall emacs
yum install --downloadonly --downloaddir=. bzr
yum remove emacs
yum upgrade

# dnf
dnf install emacs

# Shared libraries
lib<LIBRARYNAME>.so.<VERSION>

LD_LIBRARY_PATH environment variable
PATH environment variable
/etc/ld.so.conf
/etc/ld.so.conf.d/*.conf
/lib*/*
/usr/lib*/*

dynamic loader: ld-linux*.so*
cache: /etc/ld.so.cache

ldconfig
ldd /usr/bin/emacs
