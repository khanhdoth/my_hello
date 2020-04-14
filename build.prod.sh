#!/bin/bash
echo "Build My Hello production container"

echo "Current user is:"
whoami
cd /home/host/dev/git/my_hello

# delete running container
docker rm -f my-running-hello

# delete image
docker image rm my-hello:prod

# build new image
docker build -t my-hello:prod . -f prod.Dockerfile

# create new container based on new image test 10
docker run -dit --name my-running-hello -p 5000:5000 -p 5001:5001 my-hello:prod
docker exec -dit my-running-hello bin/master start