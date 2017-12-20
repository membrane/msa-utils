#!/usr/bin/env bash

docker rm -f kafka
docker run -d --name kafka -e ADVERTISED_HOST=localhost -p 2181:2181 -p 9092:9092 --env ADVERTISED_PORT=9092 -h kafka spotify/kafka