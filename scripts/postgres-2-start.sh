#!/usr/bin/env bash

export PORT=5433

echo "Starte weitere Postgres auf Port " + $PORT 

docker rm -f postgres-2
docker run -d --name postgres-2 -e POSTGRES_PASSWORD=catalogue -e POSTGRES_USER=catalogue -p $PORT:5432 postgres
