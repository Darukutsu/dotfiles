#!/bin/sh

: "${MARKED_NORMAL_BCOLOR:=0xff0000}"
: "${MARKED_ACTIVE_BCOLOR:=0x00ff00}"
: "${MARKED_FOCUSED_BCOLOR:=0xff0000}"

while bspc subscribe -c 1 node_focus node_flag > /dev/null; do
    #bspc config focused_border_color "$(bspc config focused_border_color)"

    bspc query -N -n '.sticky.!focused.window' | while read -r window; do
        chwb -c "$MARKED_NORMAL_BCOLOR" "$window"
    done
#    bspc query -N -n '.marked.active.!focused.window' | while read -r window; do
#        chwb -c "$MARKED_ACTIVE_BCOLOR" "$window"
#    done
#    bspc query -N -n "focused.marked" | while read -r window; do
#        chwb -c "$MARKED_FOCUSED_BCOLOR" "$window"
#    done
done
