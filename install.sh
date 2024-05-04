#!/bin/sh

mkdir -p ./data/mysql/data
mkdir -p ./data/mysql/logs

mkdir -p ./data/redis

mkdir -p ./data/core/data
mkdir -p ./data/koko/data
mkdir -p ./data/lion/data
mkdir -p ./data/magnus/data
mkdir -p ./data/chen/data
mkdir -p ./data/kael/data
mkdir -p ./data/web/data/logs
mkdir -p ./data/web/download

mkdir -p ./ssl

# build certbot
cd certbot
docker build -q -t certbot .
cd ..

docker compose -f docker-compose.yaml -f docker-compose-cert.yaml up -d
docker compose -f docker-compose.yaml -f docker-compose-proxy.yaml up -d