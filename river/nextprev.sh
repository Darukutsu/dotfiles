#!/bin/sh

current_tag=$(cat "$XDG_CONFIG_HOME"/river/.current_tag)

if [ $1 = next ] && [ $current_tag -lt 9 ]; then
  current_tag=$(($current_tag + 1))
elif [ $1 = prev ] && [ $current_tag -gt 0 ]; then
  current_tag=$(($current_tag - 1))
fi

echo $current_tag >"$XDG_CONFIG_HOME"/river/.current_tag
riverctl set-focused-tags $((1 << $current_tag))
