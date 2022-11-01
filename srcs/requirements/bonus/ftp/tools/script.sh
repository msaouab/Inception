#!/bin/sh

useradd -m "$FTP_USER"
echo "$FTP_USER:$FTP_PASS" | chpasswd
mkdir -p /var/run/vsftpd/empty/
echo "$FTP_USER" | tee -a /etc/vsftpd.userlist

exec "$@"