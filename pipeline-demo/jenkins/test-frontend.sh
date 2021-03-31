#!/usr/bin/env bash

echo Testing Frontend...
# yarn install
# node_modules/.bin/gulp test

# simluate frontend tests running and producing a result
sleep 5

mkdir -p ./target/test-results
cp ./jenkins/data/TEST* ./target/test-results/
echo Frontend Testing completed. 
exit 0
