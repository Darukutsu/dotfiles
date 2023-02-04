#!/bin/sh

direction="$1"
sense="$2"
# countersense is a real word, right?
if [ "$sense" = "+" ]; then
	countersense="-"
else
	countersense="+"
fi

#if [ $"bspc subscribe node_state|rg -o 'floating on'" == "floating on" ]; then
## First we try to resize using the bottom/right borders. If this fails (e.g. tiled) we fall back to top/left.
  if [ "$direction" = "x" ]; then
	  bspc node --resize "right" "${sense}20" "0" ||
	  bspc node --resize "left" "${countersense}20" "0"
  else
	  bspc node --resize "bottom" "0" "${sense}20" ||
	  bspc node --resize "top" "0" "${countersense}20"
  fi
#else
#  if [ "$direction" = "x" ]; then
#    if [ "$sense" = "+" ]; then
#	bspc node -z right 20 0 || bspc node -z left 20 0
#    else
#	bspc node -z left -20 0 || bspc node -z right -20 0
#    fi
#  else
#    if [ "$sense" = "+" ]; then
#	bspc node -z top 0 -20 || bspc node -z bottom 0 -20
#    else
#	bspc node -z bottom 0 20 || bspc node -z top 0 20
#    fi
#  fi
#fi



