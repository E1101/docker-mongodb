#!/bin/bash

## Check for optional params passed by ENV
## ...

mongod &

tail -f /var/log/mongodb/*
