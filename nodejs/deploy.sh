#!/bin/bash

docker login -u $DOCKERHUB_USERNAME -p $DOCKERHUB_PWD
docker stop nodejs
docker pull $DOCKERHUB_USERNAME/$PYTHON_APP:latest
docker run --rm -d -p 3000:3000 -e APP_VERSION=latest -e APP_HOST=node-1 --name=nodejs $DOCKERHUB_USERNAME/$NODE_JS_DIR:latest
