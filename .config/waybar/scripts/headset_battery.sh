#!/bin/bash

DEVICE="/org/freedesktop/UPower/devices/headset_dev_40_58_99_3C_BF_1C"
percentage=$(upower -i "$DEVICE" | awk '/percentage/ {print $2}' | tr -d '%')
[ -z "$percentage" ] && percentage="N/A"
echo "{\"text\": \"🎧 ${percentage}%\", \"tooltip\": \"Headset: ${percentage}%\"}"
