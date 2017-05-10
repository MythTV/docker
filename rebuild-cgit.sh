#!/bin/bash
docker rm cgit
docker rmi mythtv/cgit
docker build --tag mythtv/cgit /root/docker/cgit
docker run -d -p 8084:80 --name cgit -v /opt/gitolite:/opt/gitolite:z --log-driver=journald mythtv/cgit
