# Findr-Dockerfile

CentOS-7 Based Docker to run Findr (https://github.com/acic2015/findr), ACIC utilities (https://bitbucket.org/jaredmales/acic), and CCTools (http://ccl.cse.nd.edu/software/)

#### Includes:
- Python/Python Development/PIP 
- GSL/GSL Development 
- Boost/Boost Development 
- FFTW/FFTW Development 
- zlib/zlib Development 
- iRODS iCommands (http://irods.org/) 
- CFITSIO (http://heasarc.gsfc.nasa.gov/fitsio/) 
- SOFA (http://www.iausofa.org/index.html) 
- Eigen (http://eigen.tuxfamily.org/index.php) 
- ATLAS with LAPACK (http://www.netlib.org/lapack/) 
- MXLIB (https://bitbucket.org/jaredmales/mxlib) 
- ACIC Utilities (https://bitbucket.org/jaredmales/acic) 
- CCTools (http://ccl.cse.nd.edu/software/)


#### Version
latest

#### Dependencies
Latest version of the [Docker-Engine]

#### Installation
```sh
$ sudo docker pull pbieberstein/acic-findr:latest
```

#### Usage
To start the image as an interactive shell script
```sh
$ sudo docker run -it pbieberstein/acic-findr:latest /bin/bash
```

#### Authors
- Philipp von Bieberstein
- Asher Baltzell


### Todos

 - Include comments in Dockerfile

License
----

MIT

[//]: # (These are reference links used in the body of this note and get stripped out when the markdown processor does its job. There is no need to format nicely because it shouldn't be seen. Thanks SO - http://stackoverflow.com/questions/4823468/store-comments-in-markdown-syntax)

[Docker-Engine]: <http://docs.docker.com/engine/installation/>

