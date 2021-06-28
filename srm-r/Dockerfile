FROM ghcr.io/aberHRML/ubuntu-xcms

MAINTAINER "aberHRML" 

ARG GITHUB_PAT

RUN Rscript -e \
  'remotes::install_github("wilsontom/sRm")'
  
sRmN chmod -R 777 /R