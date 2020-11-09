#!/bin/bash

# ............#
# BSD UNIX style: - In this style, options are supplied without any leading dash (such as "aux").
# AT&T Unix style: - In this style, options are supplied with a leading dash (such as "-aux").
# GNU Linux style: - In this style, options are supplied with double leading dashes (such as "--sort").


# Monitoring commands
htop
ps
netstat
tcpdump
top / htop
vmstat 3 / vmstat -m / vmstat -a
w
uptime
ps / ps -A / ps -Al / ps -AlF / ps -AlfH / ps -AlLm / pa ax / ps aux / ps -f PID
free -h
iostat
sar
mpstat -P ALL
pmap -p PID
netstat -tulpn / netstat -nat
ss -ta / ss -ua / ss -taz
iptraf
tcpdump
ac
lastcomm
iptraf
iotop
atop
monit





# Eric Allman define "syslog"
# syslog implementation (sysklogd, syslogd-ng, rsyslog)
# systemd-journald
# https://www.digitalocean.com/community/tutorials/how-to-use-journalctl-to-view-and-manipulate-systemd-logs

ps aux | grep journald                #See if systemd-journald is alive
systemctl status systemd-journald     #Service status check
/etc/systemd/journald.conf            #Journal configuration file:
/var/log/journal                      #Persistent journald storage
/run/log/journal                      #Volatile journald storage


timedatectl status                                       #Setting the System Time
timedatectl list-timezones  
sudo timedatectl set-timezone zone

journalctl                                               #Basic Log Viewing
journalctl --reverse                                     #page from newest to oldest
journalctl --utc
journalctl --boot -1                                     #see the journal from the previous boot
journalctl --boot <caf0524a1d394ce0bdbcff75b94444fe>     #see the journal from the <bootID>
journalctl --since "2015-01-10 17:15:00"
journalctl \
    --since "2020-10-27 09:00:00" \
    --until "2020-10-27 10:00:00"
journalctl --since yesterday
journalctl \
    --since 09:00 \
    --until "1 hour ago"
journalctl --unit sshd.service
journalctl \
    --unit sshd.service \
    --unit openvpn-server@server.service \
    --since today
journalctl _UID=65534
journalctl --dmesg                  #Displaying Kernel Messages [-k]
journalctl --priority err           #Proirity alert/crit/debug/emerg/err/info/notice/warning  
journalctl --no-full                #Modifying the Journal Display --no-full/--no-hostname/--no-pager/--no-tail
journalctl --no-pager | grep masoud #skip paging and just grep for masoud
journalctl \
    --priority err \
    --outputjson-pretty
journalctl --lines=20                   #Displaying Recent Logs
journalctl --follow                     #Following Logs
journalctl --disk-usage                 #Finding Current Disk Usage
journalctl --vacuum-size 1G             #Deleting Old Logs - Size
journalctl --vacuum-time=1years         #Deleting Old Logs - Time

# Send a message to the systemd journal
echo "first log ever: $PWD" | systemd-cat -t my-app -p err

# journald centralized logging

# journald and containers
