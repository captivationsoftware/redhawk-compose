ARG rhver=latest
FROM redhawk-compose/domain:$rhver

RUN yum install -y redhawk-ide
RUN dbus-uuidgen > /etc/machine-id

CMD ["/usr/bin/rhide"]
