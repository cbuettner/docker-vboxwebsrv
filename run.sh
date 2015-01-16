#!/bin/bash

[ -z "$1" ] && echo "Error: No target argument given" && exit 1;

# remote PORT can be set via ENV or defaults to 5678
if [[ "${PORT:-0}" = "0" ]]; then
  PORT=5678
fi

ssh -L 0.0.0.0:18083:localhost:$PORT $1 "killall vboxwebsrv; vboxwebsrv -p $PORT -A null -b"

