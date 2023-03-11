#!/bin/bash
# wait-for-it.sh: wait for a service to become available

set -e

host="$1"
port="$2"
shift 2
cmd="$@"

until curl -sSf "$host:$port"; do
  >&2 echo "Service is unavailable - sleeping"
  sleep 1
done

>&2 echo "Service is up - executing command"
exec

