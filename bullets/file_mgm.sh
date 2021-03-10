#!/bin/bash


# file
pwd
ls file*.txt f??.txt b[arw].txt
cp -r
rm
mv
mkdir
cd ~ .. - /etc/yum.conf.d
ln [-s] file.txt .
readlink file.txt
type ls [passwd]
which passwd
whereis passwd
locate file.txt #updatedb
find . -maxdepth 2 -iname "*.txt"
grep -rnw '/path/to/somewhere/' -e 'pattern'

# ownership -rwxrwxr-x 1 masoud masoud 2814 Oct 26 09:42 curl.sh
chown samir file.txt
chgrp samir file.txt
chmod [g-w] / [+x] / 755 / [ug=rwx] file.txt
umask [022]

# extended ownership
-rws------  : SUDI
----rws---  : SGID
---------t  : sticky_bit
----------. : SELinux security context
----------+ : any other combination of alternate access methods


# compressing
gzip - gunzip
bzip2 - bunzip2
xz - unxz
zip - unzip

# archiving
cpio
dd if=INPUT of=OUTPUT status=progress
tar -cvf 



# text file manipulating command
touch file.txt
cat file.txt
paste file1.txt file2.txt
od -cb
split -l 3 file.txt splited.txt
sort -n file.txt
nl file.txt
more file.txt
less file.txt
head file.txt
tail -f /var/log/mail.log
wc file.txt
cut -d ":" -f 1,7 /etc/passwd
uniq file.txt
md5sum file.txt
sha224sum file.txt
sha256sum file.txt
sha384sum file.txt
sha512sum file.txt
cat /etc/passwd | grep masoud
cat /etc/passwd | grep masoud > masoud.txt
cat /etc/passwd | grep masoud >> user.txt
cat /etc/passwd | grep masoud 2> /dev/null
cat /etc/passwd | grep .*nologin | cut -d ":" -f 1 | sort | uniq | less
cat /etc/passwd | grep .*nologin | cut -d ":" -f 1 | sort | uniq | less | tee /tmp/sys-users.txt
tr " " "," < file.txt
cat file.txt | sed -e 's/A/B/g ; s/A/B/g'
ls file*.txt | xargs rm
rm -i $(ls file*.txt)
