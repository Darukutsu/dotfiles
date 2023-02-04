#!/usr/bin/env bash

if [ ! -z "$@" ]; then
  coproc "$@"
  exit 0
fi

ls -1 $XDG_CONFIG_HOME/rofi/scripts/ | sed -e 's/rofi-i.*//'
