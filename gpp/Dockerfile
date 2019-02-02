FROM redhawk-compose:domain

RUN yum install -y GPP \
                   GPP-profile \
                   redhawk-sdrroot-dev* && \
    /var/redhawk/sdr/dev/devices/GPP/cpp/gpp_setup --nodename=GppNode

ADD conf/startGPP.sh /usr/local/bin/startGPP.sh

CMD ["/usr/local/bin/startGPP.sh"]
