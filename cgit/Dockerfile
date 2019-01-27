FROM fedora:28
MAINTAINER Stuart Auchterlonie <stuarta@mythtv.org>
RUN dnf -y update && \
    dnf -y install httpd cgit && \
    dnf clean all && \
    groupadd -g 493 git && \
    useradd -u 511 -g 493 -s /bin/bash git && \
    usermod -aG git apache && \
    sed -i 's/%h/%a/g' /etc/httpd/conf/httpd.conf

ADD 00-mod_remoteip.conf /etc/httpd/conf.d/
ADD 00-server-limits.conf /etc/httpd/conf.d/
ADD status.conf /etc/httpd/conf.d/
ADD cgitrc /etc/
ADD header.include /usr/share/cgit/

EXPOSE 80
CMD ["/usr/sbin/httpd", "-DFOREGROUND"]

