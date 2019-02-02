FROM redhawk-compose:repo as repo
FROM redhawk-compose:domain

COPY --from=repo /data/yum/redhawk /data/yum/redhawk
RUN yum install -y redhawk-ide
RUN rm -rf /data/yum/redhawk
RUN dbus-uuidgen > /etc/machine-id

CMD ["/usr/bin/rhide"]
