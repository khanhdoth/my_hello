#!/bin/bash
echo "Build My Hello container"

echo "Current user is:"
whoami
cd /home/host/dev/git/my_hello

# delete running container
docker rm -f my-running-hello

# delete image
docker image rm my-hello:latest

# build new image
docker build -t my-hello:latest .

# create new container based on new image test 10
docker run -dit --name my-running-hello -p 5000:5000 -p 5001:5001 my-hello
docker exec -dit my-running-hello bin/master start