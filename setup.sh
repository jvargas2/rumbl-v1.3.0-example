#!/bin/bash

mix deps.get
mix compile
cd assets
npm install
node node_modules/brunch/bin/brunch build