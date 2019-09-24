ARG rhver=2.2.4
FROM redhawk-compose/devel:$rhver as devel

RUN yum install -y libusbx-devel \
                   wget \
                   cmake

RUN wget https://kojipkgs.fedoraproject.org//packages/rtl-sdr/0.5.4/6.fc31/src/rtl-sdr-0.5.4-6.fc31.src.rpm && \
    rpmbuild --rebuild /rtl-sdr-0.5.4-6.fc31.src.rpm && \
    mkdir -p /usr/output/rpm && \
    mv /root/rpmbuild/RPMS/x86_64/*.rpm /usr/output/rpm && \
    yum install -y /usr/output/rpm/*

ADD RTL2832U /usr/app/RTL2832U
RUN cd /usr/app/RTL2832U && \
    ./build.sh rpm && \
    mkdir -p /usr/output/rpm && \
    mv `find /root/rpmbuild -name *.rpm` /usr/output/rpm

############### Build Runtime ################
ARG rhver=latest
FROM redhawk-compose/domain:$rhver as runtime

COPY --from=devel /usr/output/rpm /usr/rpms
COPY --from=devel /usr/output/rpm /usr/rpms
RUN yum install -y /usr/rpms/* \
                   redhawk-sdrroot-dev* 

ADD conf/startRTL.sh /usr/local/bin/startRTL.sh
ADD conf/RTLNode.dcd.xml /var/redhawk/sdr/dev/nodes/RTLNode/DeviceManager.dcd.xml 

ENV debug=3 \
    group_id= \
    digital_agc_enable=0 \
    frequency_correction=0 \
    bias_enable=0

CMD ["/usr/local/bin/startRTL.sh"]
