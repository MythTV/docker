FROM centos:6
MAINTAINER Stuart Auchterlonie <stuarta@mythtv.org>
# Setup EPEL
#RUN yum -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-6.noarch.rpm
RUN groupadd -r smoon -g 5000 && \
    useradd -u 5000 -g smoon -m -d /home/smoon -s /sbin/nologin -c "Smoon User" smoon && \
    yum -y update && \
    yum -y install python-setuptools mysql-libs cronie && \
    yum clean all

COPY smolt-cron /etc/cron.d/smolt
# These are only needed to rebuild the python venv
#RUN yum -y install mysql-devel gcc python-devel
EXPOSE 8086
CMD [ "/opt/smoon_server/bin/start-all.sh" ]
