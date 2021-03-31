#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
$DIR/test-backend.sh
$DIR/test-frontend.sh
$DIR/test-static.sh
$DIR/test-performance.sh
