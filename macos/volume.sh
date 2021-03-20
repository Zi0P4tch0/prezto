#!/bin/bash

function show_volume {
    local current_vol=$(osascript -e 'output volume of (get volume settings)')
    echo "macOS Volume: $current_vol"
    echo -e "w: +5\ns: -5\nq: quit"
}

while true; do
    clear
    show_volume
    read -n 1 key
    current_vol=$(osascript -e 'output volume of (get volume settings)')
    case "$key" in
        'w') osascript -e "set volume output volume $(($current_vol + 5))";;
        's') osascript -e "set volume output volume $(($current_vol - 5))";;
        'q') break;;
    esac
done


