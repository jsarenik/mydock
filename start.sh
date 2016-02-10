. $PWD/conf.inc
docker start $DOK_NAME

PORT=$(docker port $DOK_NAME 22 | cut -d: -f2)
cat > ssh.sh <<EOF
ssh -p $PORT root@localhost
EOF
chmod a+x ssh.sh
