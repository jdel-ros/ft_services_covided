#!/bin/sh
telegraf &
adduser -D "user42" && echo "user42:bla" | chpasswd
chown -R user42:user42 /home/user42
touch /var/log/vsftpd.log
echo "user42" | tee -a /etc/vsftpd.userlist
mkdir /var/run/vsftpd
mkdir /var/run/vsftpd/empty
service vsftpd restart
tail -f /var/log/vsftpd.log