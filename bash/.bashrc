#!/bin/bash
# for syntax highlighting

[[ $- == *i* ]] && source /usr/share/blesh/ble.sh --noattach
shopt -u globstar
# If not running interactively, don't do anything

## Add this code after "source ble.sh ..."
## debuging ble.sh debug.txt
#function debug/complete-load-hook {
#  filename_debug_log=debug.txt
#  function timestamp-args.advice {
#    echo "$EPOCHREALTIME ${ADVICE_WORDS[*]}" >> "$filename_debug_log"
#  }
#  ble/function#advice \
#    before ble-decode/.hook \
#    timestamp-args.advice
#
#  function timestamp-wrap.advice {
#    echo "$EPOCHREALTIME ${ADVICE_WORDS[0]} start" >> "$filename_debug_log"
#    ble/function#advice/do
#    echo "$EPOCHREALTIME ${ADVICE_WORDS[0]} end" >> "$filename_debug_log"
#  }
#  ble/function#advice \
#    around ble/complete/progcomp/.compgen-helper-prog \
#    timestamp-wrap.advice
#  ble/function#advice \
#    around ble/complete/progcomp/.compgen-helper-func \
#    timestamp-wrap.advice
#}
#blehook/eval-after-load complete debug/complete-load-hook

[[ $- != *i* ]] && return

## OTHER VAR
export MANPAGER="$PAGER -t man"

h() {
  help "$1" 2>/dev/null ||
    $1 --help 2>/dev/null ||
    $1 -h 2>/dev/null ||
    $1 help ||
    echo "No help entry for $1"
}

# Alternatively, to pick a bit better `man` highlighting:
man() {
  if test $(/bin/man -w "${@:$#}"); then
    if [ $2 ]; then
      $PAGER man://"$2($1)"
    elif [ $1 ]; then
      $PAGER man://"$1"
    fi
  else
    h "$1"
  fi
  #  SECT=${@[-2]}; PROG=${@[-1]}; page man://"$PROG($SECT)"
}

#just keep both same for same output
HISTSIZE=10000     #writes to memory
HISTFILESIZE=10000 #write to disk
HISTCONTROL=ignoreboth:erasedups
HISTIGNORE='?:??:stty*'
source /usr/share/blesh/ble.sh --norc
# When the shell exits, append to the history file instead of overwriting it
#shopt -s histappend
# After each command, append to the history file and reread it
#PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND$'\n'}history -a; history -c; history -r"

#export SESSION_SWITCH="dbus-run-session -- gnome-shell --display-server --wayland"

PS1='[\u@\h \W]\$ '
set -o vi

## nmtui NEWT_COLORS
source "$XDG_CONFIG_HOME/bash/newt_colors"

## clipboard
#source $XDG_CONFIG_HOME/bash/clipboard

[[ -s /etc/profile.d/autojump.sh ]] && source /etc/profile.d/autojump.sh

## COMPLETION
source /usr/share/bash-completion/bash_completion
source /usr/share/bash-complete-alias/complete_alias
eval "$(register-python-argcomplete pipx)"
#shopt -s progcomp_alias
complete -F _complete_alias SS
complete -F _man man

# Enhanced file path completion in bash - https://github.com/sio/bash-complete-partial-path
#if [ -s "$XDG_CONFIG_HOME/bash-complete-partial-path/bash_completion" ]
#then
#    source "$XDG_CONFIG_HOME/bash-complete-partial-path/bash_completion"
#    _bcpp --defaults
#fi

## FZF readline search replacement
source "$XDG_CONFIG_HOME/bash/fzf.bash"
#bind -f $XDG_CONFIG_HOME/bash/inputrc.fzf

##POWERLINE
source "$XDG_CONFIG_HOME/bash/powerline"

## for echo -e $oct_bell ...
#source /usr/share/icons-in-terminal/icons_bash.sh

source /usr/share/wikiman/widgets/widget.bash

##KITTY_INTEGRATION
source "$XDG_CONFIG_HOME/bash/kitty"

##ALIAS
source "$XDG_CONFIG_HOME/bash/alias"
source "$XDG_CONFIG_HOME/bash/xdg-base-dir"

## PYTHON venv
#source "$HOME/.local/bin/bin/activate"

if [ $SHLVL -eq 1 ]; then
  cat /home/daru/Templates/Guides/0usefull-commands-I-always-forget
fi

## NNN
source "$XDG_CONFIG_HOME/bash/nnn"

## Better cd
eval "$(zoxide init bash)"

## Terminal Coloring
source "$XDG_CONFIG_HOME/zaje/zaje_functions.rc"

if [[ ${BLE_VERSION-} ]]; then
  #bleopt canvas_winch_action=redraw-prev

  ble-import contrib/colorglass
  ble-import -f integration/zoxide
  #bleopt term_true_colors=
  #bleopt colorglass_gamma=-50
  #bleopt colorglass_contrast=70
  #bleopt colorglass_brightness=-10

  # turn off history completion till ble.sh isn't fixed
  bleopt complete_auto_history=
  bleopt history_share=1
  #bleopt complete_ambiguous=1

  function ble/widget/daru/copy_readline() {
    ble/widget/vi-command/operator y
    ble/widget/vi-command/operator y
    ble/util/put "${_ble_edit_kill_ring[0]}" | xsel -bi
  }

  ble-bind -m vi_nmap -f Y daru/copy_readline
  #ble-bind -m vi_nmap -x Y _copy_readline
  ble-bind -m vi_nmap -c 'g s' 'git status'
  ble-bind -m vi_nmap -c '; n' 'nn'
  #ble-bind -m vi_nmap -c '; h' 'h'
  ble-bind -m vi_nmap -c 'C-]' 'exit'
  ble-bind -m vi_imap -c 'C-]' 'exit'
  ble-bind -m vi_xmap -c 'C-]' 'exit'
  ble-bind -m vi_cmap -c 'C-]' 'exit'
  ble-bind -m vi_omap -c 'C-]' 'exit'
  ble-bind -m menu_complete -f '__default__' menu_complete/cancel
  source "$XDG_CONFIG_HOME/bash/colemak"

  #ble-bind -x C-r _fzf_history_for_blesh
  #_fzf_history_for_blesh() {
  #  READLINE_LINE=$(history | fzf --scheme=history --tac)
  #  #READLINE_LINE=$(history|tac|sed -e 's/^ [0-9]\+  \+//'|fzf --scheme=history)
  #  READLINE_POINT=${#READLINE_LINE}
  #}
  #

  ble-attach
fi
