#!/bin/bash

# устройство G435 через UPower
DEVICE="/org/freedesktop/UPower/devices/headset_dev_40_58_99_3C_BF_1C"

# получаем процент
percentage=$(upower -i "$DEVICE" | awk '/percentage/ {print $2}' | tr -d '%')

# если нет данных — ставим N/A
[ -z "$percentage" ] && percentage="N/A"

# вывод для Waybar (только наушники)
echo "{\"text\": \"🎧 ${percentage}%\", \"tooltip\": \"Headset: ${percentage}%\"}"
