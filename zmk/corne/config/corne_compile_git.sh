#!/bin/sh

# I run this script from "$HOME"/.config/zmk/zmk/app
# build/left build/right should be renamed to abs path
# to be able to run from anywhere...i guess
#
# Only left side is enough for keymap changes, flash both if there are conf changes involving both
#HOME=/home/daru

# Initial setup
# pip3 install --user -r zephyr/scripts/requirements.txt
# OR
## python -m venv /venv/dir ##
# python -m venv python-dep
# python-dep/bin/pip3 install -r zephyr/scripts/requirements.txt
#
# if on ArchLinux sudenly stops working probably python broke, you just need to reinstall
source "$HOME"/.config/zmk/zmk/python-dep/bin/activate

is_display=y

if [ $is_display = 'y' ]; then
  ldshield="corne_left nice_view_adapter nice_view"
  rdshield="corne_right nice_view_adapter nice_view"
else
  ldshield="corne_left"
  rdshield="corne_right"
fi

#-DZMK_EXTRA_MODULES="$HOME/.config/zmk/corne/config"

west build -p -b nice_nano_v2 -d build/left -- -DSHIELD="$ldshield" -DZMK_CONFIG="$HOME/.config/zmk/corne/config" &&
  cp -f "$HOME"/.config/zmk/zmk/app/build/left/zephyr/zmk.uf2 zmk_left.uf2

west build -p -b nice_nano_v2 -d build/right -- -DSHIELD="$rdshield" -DZMK_CONFIG="$HOME/.config/zmk/corne/config" &&
  cp -f "$HOME"/.config/zmk/zmk/app/build/right/zephyr/zmk.uf2 zmk_right.uf2
