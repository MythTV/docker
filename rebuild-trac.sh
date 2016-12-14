#!/bin/bash
docker rm trac
docker rmi mythtv/trac
docker build --tag mythtv/trac /root/docker/trac
docker run -d -p 8082:8082 --name trac -v /opt/trac:/opt/trac:Z -v /opt/gitolite:/opt/gitolite:Z --log-driver=journald mythtv/trac
