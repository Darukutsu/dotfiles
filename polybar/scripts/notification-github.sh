#!/bin/sh

USER="Darukutsu"
TOKEN="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"

notifications=$(echo "user = \"$USER:$TOKEN\"" | curl -sf -K- https://api.github.com/notifications | jq ".[].unread" | grep -c true)

if [ "$notifications" -gt 0 ]; then
    echo "$notifications"
else
    echo ""
fi
