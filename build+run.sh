#!/bin/sh
# stop existing docker containers
docker kill apache2-container
docker rm apache2-container

set -xe

# pull the latest base image
docker pull ubuntu/apache2:2.4-22.04_beta

## BUILD AND RUN LOCAL
docker build . -t towatchlist/apache2php5.6

docker run -d \
    --name apache2-container \
    -e TZ=UTC -p 8080:80 \
    -v "$(pwd)/site:/var/www/html" \
    -v "$(pwd)/apache2.conf:/etc/apache2/apache2.conf" \
    towatchlist/apache2php5.6

sleep 1
open http://localhost:8080/phpversion.php
exit

## MULTI ARCH BUILD AND PUSH TO DOCKERHUB
docker buildx build \
  --push \
  --platform linux/amd64,linux/arm64 \
  -t towatchlist/apache2php5.6:latest \
  .
docker pull towatchlist/apache2php5.6:latest
