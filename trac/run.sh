#!/bin/bash
trac-admin /opt/trac/mythtv upgrade
trac-admin /opt/trac/mythtv wiki upgrade

rm -f /var/run/httpd/httpd.pid
rm -f /var/log/httpd/*log
rm -f /run/httpd/*
rm -f /tmp/httpd_lua_shm*
/usr/sbin/httpd -DFOREGROUND
tail -50 /var/log/httpd/error_log
