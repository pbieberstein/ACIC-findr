FROM centos:7
RUN yum group install "Development Tools" -y \
	&& yum install vim -y\
	&& yum install wget -y
RUN mkdir ~/library/bin -p \
	&& mkdir ~/library/include -p \
	&& mkdir ~/library/lib -p \

ENV PATH /root/library/bin:$PATH
ENV LD_LIBRARY_PATH /root/library/lib:$LD_LIBRARY_PATH
ENV INCLUDE /root/library/lib:$INCLUDE



