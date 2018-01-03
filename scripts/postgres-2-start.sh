#!/usr/bin/env bash

docker rm -f postgres-2
docker run -d --name postgres-2 -e POSTGRES_PASSWORD=catalogue -e POSTGRES_USER=catalogue -p 5433:5432 postgres
