#!/bin/bash
if [ ! -f trac/keycloak.json ]
then
	echo "Missing keycloak.json config file in trac/"
	exit 1
fi
docker rm trac
docker rmi mythtv/trac
# Convert the keycloak.json conf file to mod_auth_openidc
pushd trac
python ./generate-auth-config.py > sso.credentials
popd
docker build --tag mythtv/trac /root/docker/trac
docker run -d -p 8082:80 --name trac -v /opt/trac:/opt/trac:Z -v /opt/gitolite:/opt/gitolite:z --log-driver=journald mythtv/trac
