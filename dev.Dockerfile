FROM elixir:1.9.0-alpine as build

# install build dependencies
RUN apk add --update git build-base nodejs yarn python npm

# prepare build dir
RUN mkdir /app
WORKDIR /app

# install hex + rebar
RUN mix local.hex --force && \
    mix local.rebar --force

# set build ENV
ENV MIX_ENV=dev

# set DATABASE_URL ENV
ENV DATABASE_URL=ecto://postgres:postgres@10.128.0.7/hello_dev

# set SECRET_KEY_BASE ENV
ENV SECRET_KEY_BASE=VB+XSWMk5FvJVcXZIhJ0JFiN0R+E+2AxjIbx9NowOazugoqfKnqib47dmXD88cB+

# set PORT ENV
ENV HTTP_PORT=4000
ENV HTTPS_PORT=4001

# install mix dependencies
COPY mix.exs mix.lock ./
COPY config config
RUN mix deps.get
RUN mix deps.compile

# build assets
COPY assets assets
COPY priv priv
RUN cd assets && npm install && npm run deploy
RUN mix phx.digest

# build project
COPY lib lib
RUN mix compile