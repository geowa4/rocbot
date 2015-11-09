#!/usr/bin/env bash
set -e

docker build -t geowa4/rocbot hubot
docker push geowa4/rocbot

