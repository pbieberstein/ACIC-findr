FROM centos:7
RUN yum group install "Development Tools"
RUN yum install vim
RUN yum install wget
