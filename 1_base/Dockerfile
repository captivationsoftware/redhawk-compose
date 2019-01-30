FROM centos:7

ARG rhrepo=http://localhost/yum/redhawk/

ADD conf/redhawk.repo /etc/yum.repos.d/redhawk.repo
ADD conf/wait-for-it.sh /wait-for-it.sh
RUN echo "$rhrepo" >> /etc/yum/vars/rhrepo && \
    yum clean all

CMD ["/bin/bash"]
