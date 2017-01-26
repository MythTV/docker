#!/bin/bash
docker rmi mythtv/keycloak
docker build --tag mythtv/keycloak /root/docker/keycloak

echo "Please tag the mythtv/keycloak image with the current keycloak version"
