#!/bin/bash

echo $NODE_JS_REPO
echo $NODE_JS_DIR
echo $DOCKERHUB_USERNAME
git clone $NODE_JS_REPO
cd $NODE_JS_DIR
docker build -t $DOCKERHUB_USERNAME/$NODE_JS_DIR:latest .
cd ..
rm -r $NODE_JS_DIR
