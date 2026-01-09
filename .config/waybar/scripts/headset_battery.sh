#!/bin/bash

DEVICE="/org/freedesktop/UPower/devices/headset_dev_40_58_99_3C_BF_1C"
percentage=$(upower -i "$DEVICE" 2>/dev/null | awk '/percentage/ {print $2}' | tr -d '%')

if [[ -z "$percentage" || "$percentage" -eq 0 ]]; then
    echo '{"text": "  Disconnected", "tooltip": "Headset is off or 0%", "class": "disconnected"}'
else
    printf '{"text": "  %s%%", "tooltip": "Headset: %s%%", "class": "connected"}\n' "$percentage" "$percentage"
fi

