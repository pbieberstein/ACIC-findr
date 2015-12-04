FROM centos:7
RUN yum group install "Development Tools" -y \
	&& yum install vim -y\
	&& yum install wget -y
RUN mkdir ~/library/bin -p \
	&& mkdir ~/library/include -p \
	&& mkdir ~/library/lib -p

ENV PATH /root/library/bin:$PATH
ENV LD_LIBRARY_PATH /root/library/lib:$LD_LIBRARY_PATH
ENV INCLUDE /root/library/lib:$INCLUDE

RUN yum install gsl -y \
	&& yum install boost -y \
	&& yum install lapack -y

RUN mkdir ~/repos \
	&& cd ~/repos \
	&& wget ftp://heasarc.gsfc.nasa.gov/software/fitsio/c/cfitsio_latest.tar.gz \
	&& tar xfvz cfitsio_latest.tar.gz \
	&& cd cfitsio \
	&& ./configure --prefix=/root/library \
	&& make \
	&& make install

RUN cd ~/repos \
	&& wget https://raw.githubusercontent.com/pbieberstein/ACIC-findr/master/replace.py

RUN cd ~/repos \
	&& wget http://www.iausofa.org/2015_0209_C/sofa_c-20150209_a.tar.gz \
	&& tar xfvz sofa_c-20150209_a.tar.gz \
	&& cd sofa/20150209_a/c/src \
	&& python ~/repos/replace.py makefile "INSTALL_DIR = \$(HOME)" "INSTALL_DIR = \$(HOME)/library" \
	&& python ~/repos/replace.py makefile "CFLAGF = -c -pedantic -Wall -W -O" "CFLAGF = -c -pedantic -Wall -W -O -fPIC" \
	&& python ~/repos/replace.py makefile "CFLAGX = -pedantic -Wall -W -O" "CFLAGX = -pedantic -Wall -W -O -fPIC" \
	&& make \
	&& make test \
	&& make install

RUN cd ~/repos \
	&& wget http://bitbucket.org/eigen/eigen/get/3.2.7.tar.gz \
	&& tar xfvz 3.2.7.tar.gz \
	&& cd ~/library/include \
	&& ln -s ~/repos/eigen-eigen-b30b87236a1b/Eigen/ Eigen

RUN cd ~/repos \
	&& wget http://www.netlib.org/lapack/lapack-3.6.0.tgz \
	&& wget http://downloads.sourceforge.net/project/math-atlas/Stable/3.10.2/atlas3.10.2.tar.bz2 \
	&& tar xfvj atlas3.10.2.tar.bz2 \
	&& mv ATLAS ATLAS3.10.2 \
	&& cd ATLAS3.10.2 \
	&& mkdir LINUX \
	&& cd LINUX \
	&& ../configure -b 64 --with-netlib-lapack-tarfile=/root/repos/lapack-3.6.0.tgz -D c -DWALL -Fa alg -fPIC --shared \
	&& python ~/repos/replace.py interfaces/lapack/C2F/src/Make.inc "F77FLAGS = -O2 -mavx -fPIC -m64 -fPIC" "F77FLAGS = -O2 -mavx -fPIC -m64 -fPIC -frecursive" \
	&& make build \
	&& make check



















