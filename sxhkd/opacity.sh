#!/bin/sh

# exporting doesn't work runs in subshell
#if [ "$2" = "+" ]; then
#  export OPACITY_VALUE="0$(echo $OPACITY_VALUE + 0.1 | bc)"
#elif [ "$2" = "-" ]; then
#  export OPACITY_VALUE="0$(echo $OPACITY_VALUE - 0.1 | bc)"

if [ "$2" = "on" ]; then
  OPACITY_VALUE=0.6
fi

if [ "$1" = "active" ]; then
  pkill picom; picom --active-opacity $OPACITY_VALUE &
elif [ "$1" = "inactive" ]; then
  pkill picom; picom --inactive-opacity $OPACITY_VALUE &
fi

