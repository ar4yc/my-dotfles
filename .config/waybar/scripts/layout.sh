#!/usr/bin/env bash

KB_NAME="compx-2.4g-wireless-receiver-keyboard"

CURRENT=$(hyprctl devices -j | jq -r --arg kb "$KB_NAME" \
    '.keyboards[] | select(.name == $kb) | .active_keymap' | head -n1)

if [[ -z "$CURRENT" || "$CURRENT" == "null" ]]; then
    echo '{"text":"??","class":"error"}'
    exit 0
fi

CURRENT_SHORT=$(echo "$CURRENT" | cut -c 1-2 | tr '[:upper:]' '[:lower:]')

hyprctl switchxkblayout "$KB_NAME" next > /dev/null 2>&1

if [[ "$CURRENT_SHORT" == "en" ]]; then
    NEW="RU"
    CLASS="ru"
else
    NEW="EN"
    CLASS="en"
fi

echo "{\"text\":\"$NEW\",\"class\":\"$CLASS\"}"