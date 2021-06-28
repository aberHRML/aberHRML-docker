FROM ghcr.io/aberhrml/hrm-r:latest

RUN apt-get update

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y \
  wget \
  psmisc \
  libclang-dev \
  sudo \
  sshfs \
  locales \
  libsodium-dev \
  libssh-dev \
  zsh \
  nano \
  vim \
  htop \
  cron \
  git \
  mono-4.0-gac \
  mono-xbuild \
  libharfbuzz-dev \
  libfribidi-dev \
  texlive-full \
  libv8-dev \
  qpdf \
  libpq5 \
  libudunits2-dev \
  libgdal-dev \
  default-jdk \
  phantomjs \
  screen \
  openssh-server

RUN Rscript -e "remotes::install_github('jasenfinch/minder')"
RUN Rscript -e "remotes::install_github('jasenfinch/remoteTools')"
RUN Rscript -e "BiocManager::install('rawrr');rawrr::installRawFileReaderDLLs()"
RUN Rscript -e "remotes::install_github('jasenfinch/grover')"

RUN echo '@daily apt-get update && apt-get -y dist-upgrade && apt-get -y autoremove \n@daily Rscript -e "hrm::hrmUpdate()"\n@daily chmod -R 777 /R' | crontab
    
RUN locale-gen en_GB.UTF-8 && update-locale LANG=en_GB.UTF-8
RUN echo "user_allow_other" >> /etc/fuse.conf

COPY rstudio/data/users /data/users

RUN groupadd metabolomics

RUN wget -q \
  "https://s3.amazonaws.com/rstudio-ide-build/server/bionic/amd64/rstudio-server-1.5.127-amd64.deb" \
  && dpkg -i rstudio-server-*-amd64.deb \
  && rm rstudio-server-*-amd64.deb

COPY rstudio/config/rserver.conf /etc/rstudio/rserver.conf
COPY rstudio/config/rsession.conf /etc/rstudio/rsession.conf
COPY rstudio/config/Rprofile.site /usr/lib/R/etc/Rprofile.site
COPY rstudio/config/setup.sh /setup.sh

EXPOSE 80 22

ENTRYPOINT sh setup.sh
