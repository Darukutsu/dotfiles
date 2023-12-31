#!/bin/sh

# I run this script from "$HOME"/.config/zmk/zmk/app
# build/left build/right should be renamed to abs path
# to be able to run from anywhere...i guess

source "$HOME"/.config/zmk/zmk/python-dep/bin/activate
west build -p -b nice_nano_v2 -d build/left -- -DSHIELD="corne_left" -DZMK_CONFIG="$HOME/.config/zmk/corne/config" && \
  cp -f "$HOME"/.config/zmk/zmk/app/build/left/zephyr/zmk.uf2 zmk_left.uf2


west build -p -b nice_nano_v2 -d build/right -- -DSHIELD="corne_right" -DZMK_CONFIG="$HOME/.config/zmk/corne/config" && \
  cp -f "$HOME"/.config/zmk/zmk/app/build/right/zephyr/zmk.uf2 zmk_right.uf2
