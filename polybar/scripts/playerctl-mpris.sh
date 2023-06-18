#!/bin/sh
# POSIX-compliant probably
# dep: notify-send(optional), playerctl, sed
# todo status(hover/click), list other mpris-players then pick

player=$(playerctl metadata --format '{{playerName}}')
title=$(playerctl metadata title)
album=$(playerctl metadata album)
artist=$(playerctl metadata artist)
arturl=$(playerctl metadata --format '{{mpris:artUrl}}' | sed 's#file://##')

# icons used from FontAwesome
# feel free to edit
icplay=""
icpause=""
icnext=""
icprev=""
icloopt="1"
icloopp=""
icshuffle=""
#icplayer=""
           
# dummy files are created to display notification only once(relatively)
# if not, then you will see spam of notification flying in/out on your screen
# this could be solved with var export but (for me) it doesn't work
playing="$HOME/.config/polybar/scripts/playing.dummy"
paused="$HOME/.config/polybar/scripts/paused.dummy"

# feel free to edit content of notification
#
# example:
# display player(firefox, vlc, mpv...) with title what's playing now
# notifications=$(notify-send --icon="$arturl" --expire-time=5000 "$player" "$title")
#
# for disabling comment notifys or do following:
# notifyplay=""
notifyplay='notify-send -i "$arturl" -t 4000 Playing "$title"'
#notifypause='notify-send -i "$arturl" -t 4000 Paused "$title"'
#notifystop='notify-send -t 4000 Polybar "Stopped Playing"'

#funcion playerctl_position() {
# playerctl position
#}


#function playerctl_list() {
#
#}

function playerctl_loop() {
  if [ $(playerctl loop) = "None" ]; then
    playerctl loop Track
  elif [ $(playerctl loop) = "Track" ]; then
    playerctl loop Playlist
  elif [ $(playerctl loop) = "Playlist" ]; then
    playerctl loop None
  fi
}

function playerctl_shuffle() {
  if [ $(playerctl shuffle) = "Off" ]; then
    playerctl shuffle On
  else
    playerctl shuffle Off
  fi
}

function playerctl_polybar() {
  ## Loop
  if [ $(playerctl loop) = "Track" ];then
    icloop="$icloopt"
  elif [ $(playerctl loop) = "Playlist" ];then
    icloop="$icloopp"
  else
    icloop=""
  fi


  ## Shuffle
  if [ $(playerctl shuffle) = "Off" ] || [ !$(playerctl shuffle) ]; then
    icshuffle=""
  fi


  ## Notification handling
  if [ $(playerctl status) = "Playing" ]; then
    if [ ! -e "$playing" ]; then
      eval "$notifyplay"
      touch "$playing"
      if [ -f "$paused" ]; then
	rm "$paused"
      fi
    fi
    echo "$player $icplay $icloop $icshuffle"
  elif [ $(playerctl status) = "Paused" ]; then
    if [ ! -e "$paused" ]; then
      eval "$notifypause"
      touch "$paused"
      if [ -f "$playing" ]; then
	rm "$playing"
      fi
    fi
    echo "$player $icpause $icloop $icshuffle"
  else
    if [ -f "$playing" ] || [ -f "$paused" ]; then
      rm "$playing" 
      rm "$paused" 
      eval "$notifystop"
    fi
    echo ""
  fi
}

case "$1" in
  --play-pause)
    playerctl play-pause
    ;;
  --stop)
    # doesn't work as expected
    playerctl stop
    ;;
  --next)
    playerctl next
    ;;
  --previous)
    playerctl previous
    ;;
  --volume_up)
    playerctl volume 0.05+
    # doesn't work obviously
    #echo $(playerctl volume)
    ;;
  --volume_down)
    playerctl volume 0.05-
    #echo $(playerctl volume)
    ;;
  --loop)
    playerctl_loop
    ;;
  --shuffle)
    playerctl_shuffle
    ;;
  --position)
    # doesn't work everywhere, shows progress in percent by default
    playerctl_position
    ;;
  --list)
    #
    #playerctl -l
    ;;
  --control)
    #playerctl -p NAME
    ;;
  --polybar)
    playerctl_polybar
    ;;
  *)
    echo "ERR unknown option"
    ;;
esac
