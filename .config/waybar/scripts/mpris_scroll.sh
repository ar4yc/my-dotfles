#!/usr/bin/env bash

# Настройки
PLAYER="playerctl -l"        # mpv или другой, можно изменить на `playerctl -l` для автопоиска
WIDTH=30                     # Кол-во символов в окне
SLEEP=0.3                    # Задержка между сдвигами (сек)

# Получение названия трека и артиста
get_track() {
    playerctl -p "$PLAYER" metadata --format "{{title}} — {{artist}}" 2>/dev/null
}

# Основной цикл прокрутки
while true; do
    TRACK=$(get_track)
    if [ -z "$TRACK" ]; then
        TRACK="No player running"
    fi
    # Добавляем пробелы для плавной прокрутки
    TRACK="$TRACK    "
    LEN=${#TRACK}

    for ((i=0; i<LEN; i++)); do
        echo "${TRACK:i:WIDTH}"
        sleep $SLEEP
    done
done
