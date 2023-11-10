#!/bin/sh
#set -x

dropname="$1"
wid=$(xdotool search --classname "$dropname")

if [ -z "$wid" ]; then
  kitty --hold --class="$dropname" "$XDG_CONFIG_HOME/sxhkd/unmap_kitty.sh" "$dropname"
else
  if bspc node "$wid".!hidden -g hidden=on; then
    :
  else
    bspc node "$wid".hidden -g hidden=off -d any.active -f
  fi
fi
