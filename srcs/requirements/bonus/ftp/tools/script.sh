#!/bin/sh

# adduser "$FTP_USER"

# chown nobody:nogroup /home/"$FTP_USER"/ftp
# mkdir -p /home/"$FTP_USER"/ftp/files
# chmod a-w /home/"$FTP_USER"/ftp
# chown "$FTP_USER":"$FTP_USER" /home/med/ftp/files

/etc/init.d/vsftpd start

# exec "$@"

/usr/sbin/vsftpd /etc/vsftpd/vsftpd.conf

# useradd -m "$FTP_USER"
# echo "$FTP_USER:$FTP_PASS" | chpasswd
# mkdir -p /home/"$FTP_USER"/
# mkdir -p /var/run/vsftpd/empty/
# echo "$FTP_USER" | tee -a /etc/vsftpd.userlist

# exec "$@"