#!/bin/sh
set -x

dir="/home/daru/.config/neofetch"
imagesource='image_source="/home/daru/.config/neofetch/pic'

image="lum-tr.png"
image=$(ls "$dir/pic" | shuf -n 1)

sed -i "s|$imagesource.*|$imagesource/$image\"|" "$dir/config.conf"

