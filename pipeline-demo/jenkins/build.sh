#!/usr/bin/env bash

git clean -xfd
env
mvn -B -DskipTests clean package
