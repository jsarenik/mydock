#!/bin/sh

. $PWD/conf.inc
docker run -d -P --name $DOK_NAME $IMG_NAME
