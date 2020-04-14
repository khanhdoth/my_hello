#!/bin/bash
echo "Build My Hello dev container"

echo "Current user is:"
whoami
cd /home/host/dev/git/my_hello

# delete running container
docker rm -f my-running-dev-hello

# delete image
docker image rm my-hello:dev

# build new image
docker build -t my-hello:prod . -f dev.Dockerfile

# create new container based on new image test
docker run -dit --name my-running-dev-hello -p 4000:4000 -p 4001:4001 my-hello:dev
#docker exec -dit my-running-dev-hello bin/master start