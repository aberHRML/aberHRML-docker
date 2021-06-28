#! /bin/bash


## update the system
apt-get update -y && apt-get dist-upgrade -y && apt-get autoremove -y

## create user accounts
while read p; do
    useradd -mU -s /bin/bash $p
  usermod -a -G metabolomics $p
  echo $p:password | chpasswd
  mkdir /home/$p/data /home/$p/share
  chown $p:$p /home/$p/data
  chown $p:metabolomics /home/$p/share
done < /data/users

## make hrml user sudo
usermod -a -G sudo hrml

## update R packages
echo "Updating R packages"
Rscript -e "hrm::hrmUpdate()"

## install in-house packages
echo "Installing in-house packages"
Rscript -e "install.packages(c('hrmlcluster','nan'))"

## start cron
cron

## start ssh server
service ssh start

## start rstudio server

echo "Running rstudio-server"
rstudio-server start 
sleep infinity
