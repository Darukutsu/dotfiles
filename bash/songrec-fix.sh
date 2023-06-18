#!/bin/bash

#set -x
#
# This sets songrec default output source
# therefore songrec must run before 'pactl source-outputs' command
#

songrec recognize -d default > /tmp/songname.txt &

#wait until songrec initialized
sleep 1

client=$(pactl list short clients | grep "songrec" | cut -d$'\t' -f1)

# pick songrec id
source_output_id=$(pactl list short source-outputs | grep "$client" | cut -d$'\t' -f1)

# list sources and then pick one (type number)
pactl list short sources
printf "\nSelect Microphone ID: "
read new_source_id

# set songrec to desired input
pactl move-source-output "$source_output_id" "$new_source_id"

while [ -z "$(cat /tmp/songname.txt)" ]; do :; done
notify-send "$(cat /tmp/songname.txt)"
cat /tmp/songname.txt

if [ -e songname.txt ];then
  rm /tmp/songname.txt
fi
