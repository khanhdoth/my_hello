#!/bin/bash
echo "Debug My Hello container"

echo "Current user is:"
whoami
cd /home/khanh_doth/dev/git/my_hello

# delete running container
docker rm -f my-running-dev-hello

# create new container based on new image test 10
docker run -dit --name my-running-dev-hello -p 4000:4000 -p 4001:4001 -v /home/khanh_doth/dev/git/my_hello:/home/host/dev/git/my_hello my-hello:dev
docker exec -it my-running-dev-hello /bin/sh /home/host/dev/git/my_hello/dev.compile.sh