FROM ghcr.io/aberHRML/ubuntu-r

MAINTAINER "aberHRML" 

ARG GITHUB_PAT

## Install external dependencies
RUN apt-get install -y \
  libnetcdf-dev \
  libhdf5-dev

RUN Rscript -e \
  'BiocManager::install("xcms")'

RUN chmod -R 777 /R
