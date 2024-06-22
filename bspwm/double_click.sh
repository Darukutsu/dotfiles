#!/bin/bash
#set -x

#grep ButtonRelease
#detail: 1 -> LMB
pattern=".*device: 1.*"
unbuffer xinput --test-xi2 --root >file1
unbuffer cp file1 file2
event=$(grep -A2 '(ButtonRelease)' file2)
#event=$(unbuffer xinput --test-xi2 --root | grep -A2 '(ButtonRelease)')&
istwo=0

if [[ "$event" =~ $pattern ]]; then
  istwo++
  event="null"
fi

if [ $istwo -eq 2 ]; then
  bspc node focused -t ~fullscreen
  istwo=0
fi
