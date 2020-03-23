#!/bin/bash

VERSION=$1

docker tag private/myapp:${VERSION} public/myapp:${VERSION}
#docker push public/myapp:${VERSION}