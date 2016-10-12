FROM jboss/keycloak-mysql
MAINTAINER Stuart Auchterlonie <stuarta@mythtv.org>
RUN for i in /opt/jboss/keycloak/standalone/configuration/standalone.xml /opt/jboss/keycloak/standalone/configuration/standalone-ha.xml; do sed -i 's,<http-listener name="default" socket-binding="http" redirect-socket="https"/>,<http-listener name="default" socket-binding="http" proxy-address-forwarding="true" redirect-socket="https"/>,' $i; done
