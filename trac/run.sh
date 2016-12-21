#!/bin/bash
trac-admin /opt/trac/mythtv upgrade
trac-admin /opt/trac/mythtv wiki upgrade

rm -f /var/run/httpd/httpd.pid
/usr/sbin/httpd -DFOREGROUND

