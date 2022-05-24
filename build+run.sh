#!/bin/sh
# stop existing docker containers
docker kill apache2-container
docker rm apache2-container

set -xe

# BUILD AND RUN LOCAL
# docker build . -t towatchlist/apache2php5.6

# docker run -d \
#     --name apache2-container \
#     -e TZ=UTC -p 8080:80 \
#     -v /Users/nick/Documents/ToWatchList/DockerPHPWebsite/site:/var/www/html \
#     -v /Users/nick/Documents/ToWatchList/DockerPHPWebsite/site/apache2.conf:/etc/apache2/apache2.conf \
#     towatchlist/apache2php5.6

# sleep 1
# open http://localhost:8080/phptest.php
# exit

# MULTI ARCH BUILD AND PUSH TO DOCKERHUB
docker buildx build \
  --push \
  --platform linux/amd64,linux/arm64 \
  -t towatchlist/apache2php5.6:latest \
  .
docker pull towatchlist/apache2php5.6:latest
