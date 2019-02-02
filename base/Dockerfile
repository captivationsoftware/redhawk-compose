FROM centos:7 AS helper

# Install iproute to dynamically lookup host gateway
RUN yum install -y iproute && \
    echo $(/sbin/ip route | awk '/default/ { print $3 }') >> /etc/yum/vars/host

FROM centos:7
ARG rhrepo

COPY --from=helper /etc/yum/vars/host /etc/yum/vars/host
ADD conf/redhawk.repo /etc/yum.repos.d/redhawk.repo
RUN echo "$rhrepo" >> /etc/yum/vars/rhrepo && \
    yum clean all

CMD ["/bin/bash"]
