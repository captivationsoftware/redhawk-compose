FROM centos:7

ARG rhrepo=file:///data/yum/redhawk/

ADD conf/redhawk.repo /etc/yum.repos.d/redhawk.repo
RUN echo "$rhrepo" >> /etc/yum/vars/rhrepo && \
    yum clean all

CMD ["/bin/bash"]
