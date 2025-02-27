#!/bin/sh

REGISTRY=quay.io
REPO=rhn_ssp_adworjan/ansibleubi
VERSION=1.0

docker buildx build --platform linux/amd64 -t $REGISTRY/$REPO:$VERSION .

if [ $? -eq 0 ]
then
  echo "Successfully built image.  Pushing to registry"
  docker push $REGISTRY/$REPO:$VERSION
else
  echo "Unable to build image.  Skipping push."
fi
