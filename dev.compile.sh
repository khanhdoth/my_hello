#!/bin/bash
cd /home/host/dev/git/my_hello

# install hex + rebar
mix local.hex --force && \
    mix local.rebar --force

# install mix dependencies
mix deps.get
mix deps.compile

# build assets
# cd assets && npm install && npm run deploy
cd assets && npm install && node node_modules/webpack/bin/webpack.js --mode development

cd /home/host/dev/git/my_hello
mix ecto.create

# build project
# mix compile

# start server
mix phx.server