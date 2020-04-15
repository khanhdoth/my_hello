#!/bin/bash
echo "Build My Hello production container"

echo "Current user is:"
whoami
cd /home/khanh_doth/dev/git/my_hello

# delete running container
docker rm -f my-running-dev-hello

# delete image
docker image rm my-hello:dev

# build new image
docker build -t my-hello:dev . -f dev.Dockerfile

# create new container based on new image test 10
docker run -dit --name my-running-dev-hello -p 4000:4000 -p 4001:4001 -v /home/khanh_doth/dev/git/my_hello:/home/host/dev/git/my_hello my-hello:dev
docker exec -dit my-running-dev-hello /bin/sh /home/host/dev/git/my_hello/dev.compile.sh