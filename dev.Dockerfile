FROM elixir:1.9.0-alpine

# install build dependencies
RUN apk add --update git build-base nodejs yarn python npm inotify-tools

# set build ENV
ENV MIX_ENV=dev

# set DATABASE_URL ENV
ENV DATABASE_URL=ecto://postgres:postgres@172.17.0.1/hello_dev

# set SECRET_KEY_BASE ENV
ENV SECRET_KEY_BASE=VB+XSWMk5FvJVcXZIhJ0JFiN0R+E+2AxjIbx9NowOazugoqfKnqib47dmXD88cB+

# set PORT ENV
ENV HTTP_PORT=4000
ENV HTTPS_PORT=4001
ENV HOME=/home/host/dev/git/my_hello
WORKDIR /home/host/dev/git/my_hello
