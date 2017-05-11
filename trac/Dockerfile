FROM fedora:rawhide
MAINTAINER Stuart Auchterlonie <stuarta@mythtv.org>
RUN dnf -y update; dnf -y install git httpd mod_wsgi mod_auth_openidc trac trac-authopenid-plugin trac-spamfilter-plugin trac-ticketdelete-plugin trac-batchmodify-plugin; dnf clean all
RUN groupadd -g 493 git; useradd -u 511 -g 493 -s /bin/bash git; usermod -aG git apache
RUN pip install OhlohWidgetsMacro
# Fix OhlohWidgetsMacro to use https and the new endpoint
RUN sed -i 's,http://www.ohloh.net,https://www.openhub.net,g' /usr/lib/python2*/site-packages/ohloh_widgets/macro.py

RUN sed -i 's/%h/%a/g' /etc/httpd/conf/httpd.conf

ADD TracTicketLock-0.1-py2.7.egg /tmp
RUN easy_install /tmp/TracTicketLock-0.1-py2.7.egg; rm /tmp/TracTicketLock-0.1-py2.7.egg
RUN pip install trac-github

ADD 00-mod_remoteip.conf /etc/httpd/conf.d
ADD trac.conf /etc/httpd/conf.d/trac.conf
ADD sso.credentials /etc/httpd/conf.d/sso.credentials

EXPOSE 80
CMD ["/opt/trac/bin/run.sh"]
