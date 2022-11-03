#!/bin/sh

adduser ${TEL_USER}
echo "$TEL_USER:$TEL_PASS" | chpasswd
exec telnetd -S -b 0.0.0.0 -p 23 -F -f ${TEL_PASS}