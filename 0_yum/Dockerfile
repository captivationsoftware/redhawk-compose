FROM centos:7

ADD https://github.com/RedhawkSDR/redhawk/releases/download/2.2.1/redhawk-yum-2.2.1-el7-x86_64.tar.gz /data/yum
#COPY ./redhawk-yum-2.2.1-el7-x86_64.tar.gz /data/yum/redhawk-yum-2.2.1.tar.gz

RUN yum install -y httpd && \
    cd /data/yum && \
    tar -xvf redhawk-yum-* && \
    rm -rf *.tar.gz && mv redhawk-* redhawk

ADD conf/yum-httpd.conf /etc/httpd/conf.d/repo.conf

EXPOSE 80

HEALTHCHECK --interval=1m --timeout=3s CMD curl -f http://localhost/yum/redhawk/ || exit 1

CMD ["httpd", "-DFOREGROUND"]
