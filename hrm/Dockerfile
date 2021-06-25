FROM ghcr.io/aberHRML/ubuntu-r-xcms

MAINTAINER "aberHRML" 

ARG GITHUB_PAT

## Install external dependencies
RUN apt-get install -y \
  pandoc \
  pandoc-citeproc \
  ghostscript \
  libopenbabel-dev \
  mesa-common-dev \
  libglu1-mesa-dev \
  libfreetype6-dev \
  libfontconfig1-dev \
  libtiff5-dev \
  libcairo2-dev

## Install metabolomics packages from github
RUN Rscript -e \
  'devtools::install_github("jasenfinch/hrm")'

RUN chmod -R 777 /R
