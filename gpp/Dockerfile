################# Create Environment ################
ARG rhver=latest
FROM redhawk-compose/domain/env:$rhver as env
RUN yum install -y GPP \
                   GPP-profile \
                   redhawk-sdrroot-dev*

################### Create Runtime ##################
FROM env as runtime
ADD conf/startGPP.sh /usr/local/bin/startGPP.sh
CMD ["/usr/local/bin/startGPP.sh"]
