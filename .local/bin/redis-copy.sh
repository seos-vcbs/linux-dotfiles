#!/bin/bash

# TODO: redis-cli key * will be too taxying for production redis. modify this script to take in
# a subset of keys from a file or stdin

# source redis host name
source=$1
# target redis host name
target=$2

keys=$(redis-cli -h ${source} keys "*")

for key in ${keys}
do
  ttl=$(redis-cli -h ${source} ttl "${key}" | awk '{ print $1 }')
  if [[ "${ttl}" -lt 0 ]]; then
     ttl=0
  fi
  ttl=$(($ttl * 1000))
  echo key = ${key} ttl=${ttl}
  redis-cli -h ${source} --raw dump ${key} | head -c -1 | redis-cli -c -h ${target} -x restore ${key} ${ttl}
done
