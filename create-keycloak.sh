#!/bin/bash
MYSQL_PASSWORD=""
KEYCLOAK_PASSWORD=""
if [ x${MYSQL_PASSWORD} == x ]
then
    echo Please edit the script and specify the mysql password
    exit 1
fi
if [ x${KEYCLOAK_PASSWORD} == x ]
then
    echo Please edit the script and specify the keycloak admin password
    exit 1
fi

docker run --name keycloak -d -e MYSQL_PORT_3306_TCP_ADDR=172.17.0.1 -e MYSQL_PORT_3306_TCP_PORT=3306 -e MYSQL_DATABASE=keycloak -e MYSQL_USER=keycloak -e MYSQL_PASSWORD=${MYSQL_PASSWORD} -e KEYCLOAK_USER=admin -e KEYCLOAK_PASSWORD=${KEYCLOAK_PASSWORD} -p 8080:8080 mythtv/keycloak
