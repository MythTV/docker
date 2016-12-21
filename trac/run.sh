#!/bin/bash
trac-admin /opt/trac/mythtv upgrade
trac-admin /opt/trac/mythtv wiki upgrade

#tracd -p 8080 --basic-auth="*,/trac/.htpasswd,TRAC" /trac
#tracd -p 8082 /opt/trac/mythtv

#tracd -p 8082 --basic-auth="*,/opt/trac/htpasswd,TRAC" /opt/trac/mythtv

rm -f /var/run/httpd/httpd.pid
/usr/sbin/httpd -DFOREGROUND

# @to-do pass args as parameter
# echo "running: tracd -p 8080 $TRACD_ARGS /trac"
# tracd -p 8080 $TRACD_ARGS /trac

