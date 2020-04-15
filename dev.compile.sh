#!/bin/bash
cd /home/host/dev/git/my_hello

# install hex + rebar
mix local.hex --force && \
    mix local.rebar --force

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
mix phx.server