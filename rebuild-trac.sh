#!/bin/bash
if [ ! -f trac/keycloak.json ]
then
	echo "Missing keycloak.json config file in trac/"
	exit 1
fi
docker rmi mythtv/trac
# Convert the keycloak.json conf file to mod_auth_openidc
pushd trac
python ./generate-auth-config.py > sso.credentials
popd
docker build --tag mythtv/trac /root/docker/trac
