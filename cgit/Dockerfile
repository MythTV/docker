FROM fedora:25
MAINTAINER Stuart Auchterlonie <stuarta@mythtv.org>
RUN dnf -y update; dnf -y install httpd cgit; dnf clean all
RUN groupadd -g 493 git; useradd -u 511 -g 493 -s /bin/bash git; usermod -aG git apache

ADD cgitrc /etc

EXPOSE 80
CMD ["/usr/sbin/httpd", "-DFOREGROUND"]

