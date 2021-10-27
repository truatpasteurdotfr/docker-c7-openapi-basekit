FROM ghcr.io/truatpasteurdotfr/singularity-docker-centos7-ci::main
MAINTAINER Tru Huynh <tru@pasteur.fr>

RUN yum -y update && yum -y upgrade && \
        yum -y install wget bzip2 gcc gcc-c++ gcc-gfortran make && \
	yum -y groupinstall development && \
	yum -y clean all && \
	 date +"%Y-%m-%d-%H%M" > /last_update

COPY oneAPI.repo /etc/yum.repos.d/oneAPI.repo
RUN yum -y install \
        intel-basekit
