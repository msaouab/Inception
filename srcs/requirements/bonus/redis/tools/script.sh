#!/bin/sh

exec redis-server --port 6379 --requirepass ${FTP_PASS}