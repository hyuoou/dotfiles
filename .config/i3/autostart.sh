#!/usr/bin/env bash
xrandr --output HDMI-0 --mode 3440x1440 --rate 99.99 &
nitrogen --restore
sleep 1
picom -b
fcitx5 &
imwheel -b 45 &
nm-applet &
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
/usr/lib/xfce4/notifyd/xfce4-notifyd &
"$HOME/.config/i3/gufw_icon.sh" &
light-locker --lock-on-suspend &
pulseaudio --start &
/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets &
blueman-applet &

ps cax | grep clipit &>/dev/null
if [[ $? -ne 0 ]]; then
	clipit
fi
