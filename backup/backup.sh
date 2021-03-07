#!/bin/bash

HELP="
       NAME
       backup - backup full or incremental system backup.
SYNOPSIS
       [sudo] backup [SHORT-OPTION] [-> /dev/null]
       [sudo] backup LONG-OPTION [-> /dev/null]

DESCRIPTION
       Backup the SYSTEM to standard archive fiel.
       -i     --incremental
       --help display this help and exit
       --version
              output version information and exit

AUTHOR
        Written by msoodb.

REPORTING BUGS
       Report any bugs to <masoud.bolhassani@gmail.com>

COPYRIGHT
       Copyright © 2020 Free Software Foundation, Inc.  License GPLv3+: GNU GPL version 3 or later <https://gnu.org/licenses/gpl.html>.
       This is free software: you are free to change and redistribute it.  There is NO WARRANTY, to the extent permitted by law."

VERSION="
	backup (GNU coreutils) 8.32
	Copyright (C) 2020 Free Software Foundation, Inc.
	License GPLv3+: GNU GPL version 3 or later <https://gnu.org/licenses/gpl.html>.
	This is free software: you are free to change and redistribute it.
	There is NO WARRANTY, to the extent permitted by law.

	Written by msoodb."

if [ $1 ] && [ $1 = '--help' ]; then echo $HELP; exit; fi
if [ $1 ] && [ $1 = '--version' ]; then echo $VERSION; exit; fi

USER="masoud"
BACKUP_DIR="/opt/backup"
SOURCE="$BACKUP_DIR/packages /etc /home/masoud"
EXCLUDE="exclude.lst"
EXCLUDE_MP4="exclude.mp4.lst"
SNAPSHOT="snapshot.file"

# File name
PC="development"
DISTRO="fedora"
TYPE="full"
if [ $1 ] && [[ $1 = '-i' || $1 = '--incremental' ]] && [ -f $SNAPSHOT  ]; then TYPE="incremental"; fi
DATE=$(date "+%Y-%m-%d-%H%M%S")
FILE="$BACKUP_DIR/$PC-$DISTRO-$TYPE-$DATE.tar.gz"


# Create structure
[ ! -d $BACKUP_DIR ] && mkdir $BACKUP_DIR
[ ! -d $BACKUP_DIR/packages ] && mkdir -p $BACKUP_DIR/packages

# Create packages list
rpm -qa > $BACKUP_DIR/packages/installed-rpm.log
rpm -qa --queryformat='%{NAME} \n' > $BACKUP_DIR/packages/installed-rpm-name-only.log

# Remove snapshot in case of full backup
if [ $TYPE = "full" ] && [ -f $SNAPSHOT ]
then rm $SNAPSHOT
fi

# ----------------------- #
# Prepare EXCLUDE_MP4 list
# Add here another exception
find /home/masoud/.Resource/ -iname *.mp4 > $EXCLUDE_MP4


# ------------------------ #
# Uncomment for urgent exit 
# echo $FILE; exit 1


# Backup
tar --create \
    --file=$FILE \
    --verbose \
    --preserve-permissions \
    --gzip \
    --exclude-from=$EXCLUDE \
    --exclude-from=$EXCLUDE_MP4 \
    --listed-incremental=$SNAPSHOT \
    $SOURCE
tar --list --verbose --verbose --file=$FILE

# Clean tmp files
sudo rm -rf $BACKUP_DIR/packages

# Restore
# tar --extract -gunzip --verbose --file=$FILE --listed-incremental=/dev/null --directory=/opt/restore
