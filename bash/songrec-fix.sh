#!/bin/bash

#set -x
#
# This sets songrec default output source
# therefore songrec must run before 'pactl source-outputs' command
#

# list sources and then pick one
device=$(pactl list short sources | cut -f2 | fzf --header="Pick device:")

# set songrec to desired input
songrec recognize -d "$device" >/tmp/songname.txt &

while [ -z "$(cat /tmp/songname.txt)" ]; do :; done
notify-send "$(cat /tmp/songname.txt)"
cat /tmp/songname.txt

if [ -e songname.txt ]; then
  rm /tmp/songname.txt
fi
