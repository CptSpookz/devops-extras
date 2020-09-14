#! /bin/bash

echo "Inicializando container do MySQL"
docker run --name "db" \
           --env-file "${PWD}"/.envfile \
           -p 3306:3306 \
           -v "${PWD}"/data:/var/lib/mysql \
           -v init.sql:/docker-entrypoint-initdb.d/ \
           -d mysql:latest