#!/bin/sh

history_count=$(dunstctl count history)

dunstctl history | jq ".data.[].[]|{time:.timestamp.data, appname:.appname.data, id:.id.data}"

case "$1" in
show)
  for _ in $(seq $history_count); do
    dunstctl history-pop
  done
  ;;
close)
  dunstctl close-all
  ;;
rm)
  dunstctl history-rm "$2"
  ;;
clear)
  dunstctl history-clear
  ;;
#next-group) ;;
#prev-group) ;;
#next) ;;
#  dunstctl close "$id"
#  dunstctl history-pop "$id"
#prev) ;;
esac
