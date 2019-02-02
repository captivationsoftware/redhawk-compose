FROM redhawk-compose:repo as repo
FROM redhawk-compose:omniserver

COPY --from=repo /data/yum/redhawk /data/yum/redhawk

RUN yum install -y redhawk \
                   redhawk-sdrroot-dom* \
                   bulkioInterfaces \
                   frontendInterfaces

RUN rm -rf /data/yum/redhawk

# Define redhawk-required environment variables
ENV SDRROOT=/var/redhawk/sdr \
    OSSIEHOME=/usr/local/redhawk/core \
    PYTHONPATH=/usr/local/redhawk/core/lib/python

# Define omniserver hostnames (To establish omniORB connections)
ENV nameserver=omniNames \
    eventserver=omniEvents \
    domainname=REDHAWK_DEV

ADD conf/startDomain.sh /usr/local/bin/startDomain.sh

CMD ["/usr/local/bin/startDomain.sh"]
