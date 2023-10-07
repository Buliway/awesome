#!/bin/sh

run() {
  if ! pgrep -f "$1" ;
  then
    "$@"&
  fi
}

run /usr/bin/lxpolkit
run knsip
run copyq
