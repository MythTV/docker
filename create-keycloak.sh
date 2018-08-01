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

docker stop keycloak
docker rm keycloak
docker run --name keycloak -d -e DB_ADDR=172.17.0.1 -e DB_PORT=3306 -e DB_DATABASE=keycloak -e DB_USER=keycloak -e DB_PASSWORD=${MYSQL_PASSWORD} -e KEYCLOAK_USER=admin -e KEYCLOAK_PASSWORD=${KEYCLOAK_PASSWORD} -p 8080:8080 mythtv/keycloak
