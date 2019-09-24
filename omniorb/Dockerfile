################# Create Environment ################
ARG rhver=latest
FROM redhawk-compose/base/env:$rhver as env

RUN yum install -y omniORB-servers \
                   omniORB-utils \
                   omniEvents-server

ADD conf/setupOmni.sh /usr/local/bin/setupOmni.sh

ENV nameserver=localhost \
    eventserver=localhost

ENTRYPOINT ["/usr/local/bin/setupOmni.sh"]

################### Create Runtime ##################
FROM env as runtime

ADD conf/omniNames.sh /usr/local/bin/omniNames.sh
ADD conf/omniEvents.sh /usr/local/bin/omniEvents.sh
ADD conf/omniNamesEvents.sh /usr/local/bin/omniNamesEvents.sh

EXPOSE 2809 11169

CMD ["/usr/local/bin/omniNamesEvents.sh"]
