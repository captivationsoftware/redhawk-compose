FROM redhawk-compose:repo as repo
FROM redhawk-compose:domain

COPY --from=repo /data/yum/redhawk /data/yum/redhawk
RUN yum install -y GPP \
                   GPP-profile \
                   redhawk-sdrroot-dev* && \
    /var/redhawk/sdr/dev/devices/GPP/cpp/gpp_setup --nodename=GppNode

RUN rm -rf /data/yum/redhawk

ADD conf/startGPP.sh /usr/local/bin/startGPP.sh

CMD ["/usr/local/bin/startGPP.sh"]
