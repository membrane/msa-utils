#!/usr/bin/env bash

docker rm -f postgres
docker run -d --name postgres -e POSTGRES_PASSWORD=catalogue -e POSTGRES_USER=catalogue -p 5433:5432 postgres
