#!/bin/bash
docker rmi mythtv/keycloak
docker build --tag mythtv/keycloak /root/docker/keycloak

VERSION=`docker inspect quay.io/keycloak/keycloak | grep KEYCLOAK_VERSION | cut -f2 -d= | sed -e 's/",//g' | head -1`

docker tag mythtv/keycloak:latest mythtv/keycloak:${VERSION}
