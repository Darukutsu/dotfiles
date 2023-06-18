#!/bin/sh
#set -x

wid=$(xdotool search --classname "kitty-drop")

if [ -z "$wid" ]; then
  kitty --class="kitty-drop" &
  #while :; do
  #  kitty --class="kitty-drop" &
  #  if [ $? ]; then break; fi
  #done
  sleep 1
  wid=$(xdotool search --classname "kitty-drop")
  if ! pgrep unmap_kitty; then
    "$XDG_CONFIG_HOME/sxhkd/unmap_kitty.sh" "$wid" &
  fi
else
  if bspc node "$wid".!hidden -g hidden=on; then
    :
  else
    bspc node "$wid".hidden -g hidden=off -d any.active -f
  fi
fi
