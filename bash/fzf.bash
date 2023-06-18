# fzf.bash

# If ble/contrib/fzf cannot find the fzf directory, please set the following
# variable "_ble_contrib_fzf_base" manually.  The value
# "/path/to/fzf-directory" should be replaced by a path to the fzf directory
# such as "$HOME/.fzf" or "/usr/share/fzf" that contain
# "shell/{completion,key-bindings}.bash" or "{completion,key-bindings}.bash".

#_ble_contrib_fzf_base=/usr/share/fzf

# Setup fzf
# ---------
#if [[ ! "$PATH" == *"/usr/bin/fzf"* ]]; then
#  export PATH="${PATH:+${PATH}:}/usr/bin/fzf"
#fi

# Auto-completion
# ---------------
#if [[ $- == *i* ]]; then
#  # Note: If you would like to combine fzf-completion with bash_completion, you
#  # need to load bash_completion earlier than fzf-completion.
#
#  #source /path/to/bash_completion.sh
#
#  if [[ ${BLE_VERSION-} ]]; then
#    ble-import -d contrib/fzf-completion
#  else
#    source /usr/share/fzf/completion.bash 2> /dev/null
#  fi
#fi

# Key bindings
# ------------
if [[ ${BLE_VERSION-} ]]; then
  ble-import contrib/fzf-key-bindings
  #ble-import -d integration/fzf-key-bindings
else
  source /usr/share/fzf/key-bindings.bash
fi
