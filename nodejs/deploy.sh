#!/bin/bash

docker login -u $DOCKERHUB_USERNAME -p $DOCKERHUB_PWD
docker stop nodejs
docker pull $DOCKERHUB_USERNAME/$NODE_JS_DIR:latest
docker run --rm -d -p 3000:3000 -e APP_VERSION=latest -e APP_HOST=$HOSTNAME --name=nodejs $DOCKERHUB_USERNAME/$NODE_JS_DIR:latest
