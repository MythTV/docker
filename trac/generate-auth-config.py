#!/usr/bin/python

import json, uuid

with open ('keycloak.json') as json_data:
    kc = json.load(json_data)

print("OIDCProviderMetadataURL " + kc["auth-server-url"] + "/realms/" + kc["realm"] + "/.well-known/openid-configuration")
print("OIDCCryptoPassphrase " + uuid.uuid4().hex)
print("OIDCClientID " + kc["resource"])
print("OIDCClientSecret \"" + kc["credentials"]["secret"] + "\"")
