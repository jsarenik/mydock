#!/bin/sh

. $PWD/conf.inc
docker rm $DOK_NAME
docker rmi $IMG_NAME
