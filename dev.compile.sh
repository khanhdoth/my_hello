#!/bin/bash
mix deps.get
mix deps.compile
mix compile
mix phx.server

cd /home/host/dev/git/my_hello

# install mix dependencies
mix deps.get
mix deps.compile

# build assets
cd assets && npm install && npm run deploy

cd /home/host/dev/git/my_hello
mix phx.digest

# build project
mix compile

# start server
mix phx.start