FROM centos:7

ARG REDHAWK_TAR

ADD $REDHAWK_TAR /data/yum/redhawk-yum.tar.gz

RUN yum install -y httpd && \
    cd /data/yum && \
    tar -xvf redhawk-yum.tar.gz && \
    rm -rf *.tar.gz && mv redhawk-* redhawk

ADD conf/yum-httpd.conf /etc/httpd/conf.d/repo.conf

EXPOSE 80

HEALTHCHECK --interval=1m \
            --timeout=3s \
            CMD curl -f http://localhost/yum/redhawk/ || exit 1

CMD ["httpd", "-DFOREGROUND"]
