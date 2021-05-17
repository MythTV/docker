#!/bin/bash
podman rmi mythtv/smolt
podman build --tag mythtv/smolt /root/docker/smolt
