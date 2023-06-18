#!/bin/sh

file="/tmp/tridactyl_message"

touch "$file" && kitty nvim "$file" && xclip -i "$file" && rm "$file"
