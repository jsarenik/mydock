. $PWD/conf.inc
docker run -d -P --name $DOK_NAME $IMG_NAME
# or docker run $DOK_NAME
docker port $DOK_NAME 22
