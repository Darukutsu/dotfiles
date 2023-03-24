#!/bin/bash

while true; do
    IFS= read -rsn1 input
    case $input in
        h) xdotool mousemove_relative -- -30 0;;
        j) xdotool mousemove_relative -- 0 30;;
        k) xdotool mousemove_relative -- 0 -30;;
        l) xdotool mousemove_relative -- 30 0;;
        H) xdotool mousemove_relative -- -10 0;;
        J) xdotool mousemove_relative -- 0 10;;
        K) xdotool mousemove_relative -- 0 -10;;
        L) xdotool mousemove_relative -- 10 0;;
      " ") xdotool click 1;;
        q) exit 0;;
    esac
done
