#!/bin/bash
docker rm cgit
docker rmi mythtv/cgit
docker build --tag mythtv/cgit /root/docker/cgit
docker run -d -p 8084:80 --name cgit -v /opt/repositories:/opt/repositories:z --log-driver=journald mythtv/cgit
