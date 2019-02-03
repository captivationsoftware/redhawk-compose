FROM redhawk-compose:domain

RUN yum install -y GPP \
                   GPP-profile \
                   redhawk-sdrroot-dev*

ADD conf/startGPP.sh /usr/local/bin/startGPP.sh

CMD ["/usr/local/bin/startGPP.sh"]
