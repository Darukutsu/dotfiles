#!/bin/bash

# recognizes only one song then exits
nohup songrec recognize -d default > shazam.txt &

# need to wait before songrec init
sleep 1

# expecting there will be only songrec
SOURCE_OUTPUT_ID=$(pactl list short source-outputs | cut -d$'\t' -f1)

# list sources and then pick one (type number)
pactl list short sources
read SOURCE_ID

pactl move-source-output "$SOURCE_OUTPUT_ID" "$SOURCE_ID"

# wait until recognizes
wait

cat shazam.txt && rm shazam.txt
