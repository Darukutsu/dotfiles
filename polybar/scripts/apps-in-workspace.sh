#!/bin/sh

windows_on_current_workspace=$(bspc query -N -n .window.local.!hidden | wc -l)

if [ $windows_on_current_workspace -gt 0 ];then
    echo "$windows_on_current_workspace"
else
    echo ""
fi

#
