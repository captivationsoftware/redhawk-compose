ARG rhver=latest
FROM redhawk-compose/domain/env:$rhver

RUN yum install -y make \
                   rpm-build \
                   redhawk-devel

ENV PATH=$PATH:/usr/local/redhawk/core/bin

CMD ["/bin/bash"]
