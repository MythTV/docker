#!/bin/bash
docker rm keycloak
docker rmi mythtv/keycloak
docker build --tag mythtv/keycloak /root/docker/keycloak
