#!/usr/bin/env bash

docker run -d \
    --name mongodb \
    -p 27017:27017 \
    -e MONGODB_USERNAME=history \
    -e MONGODB_PASSWORD=history \
    -e MONGODB_DBNAME=history \
    frodenas/mongodb