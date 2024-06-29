#!/bin/sh
stage="$1"
shift
rest="$@"
docker compose -f compose.$stage.yml $rest
