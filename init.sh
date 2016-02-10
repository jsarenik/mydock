#!/bin/sh

. $PWD/conf.inc
docker build -t $IMG_NAME .
