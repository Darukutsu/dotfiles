#!/bin/sh

volume=$(pamixer --get-volume)
dunstify -a "changevolume" -r 9993 -h int:value:"$volume" "Volume: ${volume}%" -t 1000
