cd /home/dev/git/my_hello
mix deps.get
mix deps.compile
cd assets && npm install && npm run deploy
cd /home/dev/git/my_hello
mix phx.digest
mix compile
mix phx.server