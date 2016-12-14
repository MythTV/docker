FROM fedora:25
MAINTAINER Stuart Auchterlonie <stuarta@mythtv.org>
#RUN dnf -y update; dnf -y install httpd mod_auth_openidc trac trac-authopenid-plugin trac-git-plugin trac-spamfilter-plugin trac-ticketdelete-plugin trac-batchmodify-plugin; dnf clean all
RUN dnf -y install httpd mod_auth_openidc trac trac-authopenid-plugin trac-git-plugin trac-spamfilter-plugin trac-ticketdelete-plugin trac-batchmodify-plugin; dnf clean all

EXPOSE 8082
CMD ["/opt/trac/bin/run.sh"]
