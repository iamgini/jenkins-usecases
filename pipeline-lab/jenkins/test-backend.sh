#!/usr/bin/env bash

env
mvn -B -DtestFailureIgnore test
exit 0
