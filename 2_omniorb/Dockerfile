FROM redhawk-compose:base

RUN yum install -y omniORB-servers \
                   omniORB-utils \
                   omniEvents-server

ADD conf/omniNames.sh /omniNames.sh
ADD conf/omniEvents.sh /omniEvents.sh

ENV nameserver=omniNames \
    eventserver=omniEvents 
