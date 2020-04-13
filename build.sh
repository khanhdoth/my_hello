#!/bin/bash
echo "Build My Hello container 2"

echo "Current user is:"
whoami
cd /home/host/dev/my_hello

# delete running container
docker rm -f my-running-hello

# delete image
docker image rm my-hello:lates

# build new image
docker build -t my-hello:latest .

# create new container based on new image test 10
docker run -dit --name my-running-hello -p 4000:4000 my-hello
docker exec -dit my-running-hello bin/hello start