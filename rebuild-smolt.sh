#!/bin/bash
docker rmi mythtv/smolt
docker build --tag mythtv/smolt /root/docker/smolt
