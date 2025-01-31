#!/bin/sh

if [ -s "$SXHKD_MODE_FILE" ]; then
  file=$(dirname "$SXHKD_MODE_FILE")/$(cat "$SXHKD_MODE_FILE")

  grep -oE '^[a-zA-Z].*$' "$file" | tr '\n' '#' | sed 's/#/ | /g' | zscroll -l 25 -d 0.2 -p ' | ' &
  wait
fi

echo ""
