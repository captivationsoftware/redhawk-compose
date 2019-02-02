FROM redhawk-compose:domain

RUN yum install -y redhawk-ide
RUN dbus-uuidgen > /etc/machine-id

CMD ["/usr/bin/rhide"]
