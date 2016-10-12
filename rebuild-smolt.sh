#!/bin/bash
docker rm smolt
docker rmi mythtv/smolt
docker build --tag mythtv/smolt /root/docker/smolt
docker run -d -p 8086:8086 --name smolt -v /opt/smoon_server:/opt/smoon_server:Z --log-driver=journald mythtv/smolt
