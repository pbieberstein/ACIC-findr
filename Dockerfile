FROM centos:7
CMD yum group install "Development Tools"
CMD yum install vim
CMD yum install wget