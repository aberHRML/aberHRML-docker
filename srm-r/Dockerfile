FROM ghcr.io/aberHRML/xcms-r

MAINTAINER "aberHRML" 

ARG GITHUB_PAT

RUN Rscript -e 'renv::install("wilsontom/sRm")'
  
RUN chmod -R 777 /R
