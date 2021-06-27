FROM rocker/r-ver
MAINTAINER "aberHRML"

RUN apt-get update \
&& apt-get -y dist-upgrade 

RUN Rscript -e 'install.packages("classyfireR")'
