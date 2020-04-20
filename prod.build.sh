#!/bin/bash
echo "Build My Hello production container"

docker exec -it my-running-jenkins sh /home/host/dev/git/my_hello/prod.build.jenkins.sh