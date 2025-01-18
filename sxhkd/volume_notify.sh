#!/bin/sh

if [ $(pamixer --get-mute) = true ]; then
  muted="Muted "
fi

volume=$(pamixer --get-volume)
dunstify -a "changevolume" -r 9993 -h int:value:"$volume" ""$muted"Volume: ${volume}%" -t 1000
