. $PWD/conf.inc
docker start $DOK_NAME

PORT=$(docker port $DOK_NAME 22 | cut -d: -f2)
cat > ssh.sh <<EOF
#!/bin/sh

ssh -o "NoHostAuthenticationForLocalhost yes" -p $PORT $SSH_USER@localhost
EOF
chmod a+x ssh.sh
