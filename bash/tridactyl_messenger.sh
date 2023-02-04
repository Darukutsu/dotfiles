#!/bin/sh

file="$XDG_CONFIG_HOME/bash/tridactyl_message"

touch "$file" && kitty nvim "$file" && xclip -i "$file" && rm "$file"
