#!/bin/sh

useradd -m "$FTP_USER"
echo "$FTP_USER:$FTP_PASS" | chpasswd
mkdir -p /var/run/vsftpd/empty/
echo "$FTP_USER" | tee -a /etc/vsftpd.userlist

/etc/init.d/vsftpd start

# /usr/sbin/vsftpd /etc/vsftpd/vsftpd.conf

exec "$@"