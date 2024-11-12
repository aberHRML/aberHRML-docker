FROM ghcr.io/jasenfinch/ubuntu-r:latest

RUN apt-get update \
  && apt-get -y dist-upgrade

RUN apt-get install -y \
  curl \
  libsodium-dev \
  mono-4.0-gac
  
RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
RUN add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
RUN apt-cache policy docker-ce

RUN apt-get update \
  && apt-get install -y \
  docker-ce

RUN Rscript -e "devtools::install_github('jasenfinch/grover')"

RUN Rscript -e "rawrr::installRawFileReaderDLLs();rawrr::installRawrrExe()"

ENTRYPOINT Rscript -e "grover::groverAPI(grover::readGrover('/grover_host.yml'),log_dir = '$GROVER_CACHE/logs',temp_dir = '$GROVER_CACHE/temp')"
