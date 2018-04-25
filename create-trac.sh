#!/bin/bash
systemctl stop trac
docker stop trac
docker rm trac
docker run -d -p 8082:80 --name trac -v /opt/trac:/opt/trac:Z -v /opt/repositories:/opt/repositories:z --log-driver=journald mythtv/trac
