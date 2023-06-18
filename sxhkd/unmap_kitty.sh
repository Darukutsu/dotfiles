#!/bin/bash
#set -x

wid=$1

bspc subscribe node_focus | while read -a line; do
  node_id=$(printf "%d" "${line[3]}")
  if [ "$node_id" -ne "$wid" ]; then
    bspc node "$wid" -g hidden=on
  fi
done
