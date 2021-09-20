FROM ghcr.io/truatpasteurdotfr/docker-c7-ci:main
MAINTAINER Tru Huynh <tru@pasteur.fr>

RUN yum -y update && yum -y upgrade && \
        yum -y install wget bzip2 gcc gcc-c++ gcc-gfortran make && \
	yum -y clean all && \
	 date +"%Y-%m-%d-%H%M" > /last_update
RUN wget https://registrationcenter-download.intel.com/akdlm/irc_nas/17977/l_BaseKit_p_2021.3.0.3219_offline.sh && \
    bash l_BaseKit_p_2021.3.0.3219_offline.sh \
    --log l_BaseKit_p_2021.3.0.3219_offline.log \
    --remove-extracted-files yes \
    -a \
     --action install \
     --cli \
     --eula accept \
     --intel-sw-improvement-program-consent decline \
     --silent && \
     /bin/rm l_BaseKit_p_2021.3.0.3219_offline.sh

