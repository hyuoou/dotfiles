#!/usr/bin/env bash

entries="󰐥  Shutdown
󰑓  Reboot
󰤄  Suspend
󰌾  Lock Screen
󰍃  Logout"
SELECTED=$(echo -e "$entries" | wofi --dmenu -p "Power")

if [ -z "$SELECTED" ]; then
    exit 0
fi

case "$SELECTED" in
    *Shutdown)
        systemctl poweroff ;;
    *Reboot)
        systemctl reboot ;;
    *Suspend)
        systemctl suspend ;;
    *"Lock Screen")
        swaylock ;;
    *Logout)
        swaymsg exit ;;
esac
