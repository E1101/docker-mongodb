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

FROM bare/mongodb:3.0

MAINTAINER Payam Naderi <naderi.payam@gmail.com>

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

