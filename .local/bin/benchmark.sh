#!/bin/sh

programname=$0

usage() {
    cat <<EOF
Usage: 
  $programname <func_name>

Parameters:
  func_name             func name

Example:
  $programname BenchmarkDownload
EOF
}

if [ "$#" -ne 1 ]; then
    usage
    exit 1
fi

FUNC=$1

go test -benchmem -run=^$ . -bench ^${FUNC}$ -cpuprofile=cpu.out -memprofile=mem.out; \
go tool pprof --alloc_space mem.out