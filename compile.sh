#!/bin/bash
mix deps.get
mix deps.compile
mix compile
mix phx.server