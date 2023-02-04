#!/bin/sh

gsconnect=$($HOME/.local/share/gnome-shell/extensions/gsconnect@andyholmes.github.io/service/daemon.js -l)

#check for '-a' flag to enchance

if [ ! -z $gsconnect ]; then
  echo ""
else
  echo ""
fi

