FROM redhawk-compose:repo as repo

FROM redhawk-compose:base

COPY --from=repo /data/yum/redhawk /data/yum/redhawk
RUN yum install -y omniORB-servers \
                   omniORB-utils \
                   omniEvents-server
RUN rm -rf /data/yum/redhawk

ADD conf/omniNames.sh /usr/local/bin/omniNames.sh
ADD conf/omniEvents.sh /usr/local/bin/omniEvents.sh
ADD conf/omniNamesEvents.sh /usr/local/bin/omniNamesEvents.sh
ADD conf/setupOmni.sh /usr/local/bin/setupOmni.sh

EXPOSE 2809 11169

ENV nameserver=localhost \
    eventserver=localhost

ENTRYPOINT ["/usr/local/bin/setupOmni.sh"]
CMD ["/usr/local/bin/omniNamesEvents.sh"]
