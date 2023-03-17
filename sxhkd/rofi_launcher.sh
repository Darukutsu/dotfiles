#!/bin/sh

## Author : Aditya Shakya (adi1090x)
## Github : @adi1090x
#
## Rofi   : Launcher (Modi Drun, Run, File Browser, Window)
#
## Available Styles
#
## style-1     style-2     style-3     style-4     style-5
## style-6     style-7     style-8     style-9     style-10

dir="$HOME/.config/rofi/launchers/type-3"
theme='style-5'

## Run
if [ "$1" = "combi" ];then
	rofi -show combi -theme "$dir/$theme"
elif [ "$1" = "window" ];then
	rofi -show window -theme "$dir/$theme"
elif [ "$1" = "clipboard" ];then
	rofi -modi "clipboard:clipmenu,emoji" -show "clipboard" -theme "$dir/$theme"
else
  echo "unknown option"
fi
