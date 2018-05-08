FROM fedora:27
MAINTAINER Stuart Auchterlonie <stuarta@mythtv.org>
RUN dnf -y update; dnf -y install git httpd mod_wsgi mod_auth_openidc trac trac-authopenid-plugin trac-spamfilter-plugin trac-ticketdelete-plugin python2-PyMySQL patch; dnf clean all
RUN groupadd -g 493 git; useradd -u 511 -g 493 -s /bin/bash git; usermod -aG git apache
RUN pip install OhlohWidgetsMacro
# Fix OhlohWidgetsMacro to use https and the new endpoint
RUN sed -i 's,http://www.ohloh.net,https://www.openhub.net,g' /usr/lib/python2*/site-packages/ohloh_widgets/macro.py

RUN sed -i -e 's/%h/%a/g' -e 's/CustomLog/#CustomLog/g' /etc/httpd/conf/httpd.conf

ADD TracTicketLock-0.1-py2.7.egg /tmp
RUN easy_install /tmp/TracTicketLock-0.1-py2.7.egg; rm /tmp/TracTicketLock-0.1-py2.7.egg
RUN pip install trac-github

# Patch trac to use PyMySQL
# Upstream Supported added to v1.3 in https://trac.edgewall.org/ticket/12821
# https://github.com/edgewall/trac/commit/f4ec3096bb0f7b03c2c8211f28edb5ffd462bb3b#diff-1577961544e00a3b5f20d5331251f33c
ADD fix-requires.diff pymysql-support.diff minimum-index-sizes.diff /tmp/
RUN cd /; patch -p0 < /tmp/fix-requires.diff; patch -p0 < /tmp/pymysql-support.diff; patch -p0 < /tmp/minimum-index-sizes.diff

ADD 00-mod_remoteip.conf /etc/httpd/conf.d
ADD 00-server-limits.conf /etc/httpd/conf.d
ADD status.conf /etc/httpd/conf.d
ADD trac.conf /etc/httpd/conf.d/trac.conf
ADD sso.credentials /etc/httpd/conf.d/sso.credentials

EXPOSE 80
CMD ["/opt/trac/bin/run.sh"]
