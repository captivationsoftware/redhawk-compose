FROM redhawk-compose:omniserver

RUN yum install -y redhawk \
                   redhawk-sdrroot-dom* \
                   bulkioInterfaces \
                   frontendInterfaces

ENV SDRROOT=/var/redhawk/sdr \
    OSSIEHOME=/usr/local/redhawk

ADD conf/startDomain.sh /startDomain.sh
