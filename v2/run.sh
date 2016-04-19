#!/bin/bash
set -m

## Check for optional params passed by ENV
## ...

mongod &

if [ ! -f /var/log/mongodb/mongod.log ]; then
    ## touch default file so tail not provide error
    touch /var/log/mongodb/mongod.log
fi

tail -f /var/log/mongodb/*

fg
