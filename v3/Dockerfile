# --------------------------------------------------------------------
# | Build Specific Version:
# | 
# |  build specific release version of mongo by passing build time
# |  argument that define version.
# |  $ docker build --build-arg version=3.2 .
# | 
# | Config File Stored In:
# |  /etc/mongod.conf
# |
# | Note: Mongo run with the "mongodb" user account.
# |

FROM ubuntu:latest

MAINTAINER Payam Naderi <naderi.payam@gmail.com>


ARG version=3.2

# Install base packages
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927 && \
    echo "deb http://repo.mongodb.org/apt/ubuntu "$(lsb_release -sc)"/mongodb-org/"${version}" multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-${version}.list && \
    apt-get update && \
    apt-get install -y \
        mongodb-org=${version} \ 
        mongodb-org-server=${version} \
        mongodb-org-shell=${version} \ 
        mongodb-org-mongos=${version} \
        mongodb-org-tools=${version} && \
## apt-get will upgrade the packages when a newer version becomes available. 
## To prevent unintended upgrades, pin the package.
    echo "mongodb-org hold" | sudo dpkg --set-selections && \
    echo "mongodb-org-server hold" | sudo dpkg --set-selections && \
    echo "mongodb-org-shell hold" | sudo dpkg --set-selections && \
    echo "mongodb-org-mongos hold" | sudo dpkg --set-selections && \
    echo "mongodb-org-tools hold" | sudo dpkg --set-selections

## db data files and logs 
VOLUME ["/data/db", "/var/log/mongodb/"]

## Set Environment Default Variables Override Default Behavior
## This Environment Will Check On run.sh
# ENV

ADD run.sh /run.sh
RUN chmod 755 /*.sh

## mongo by default listening on 27017
EXPOSE 27017

CMD ["/run.sh"]

