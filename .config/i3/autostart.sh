#!/usr/bin/env bash
xmodmap ~/.xmodmap &
xrandr --output HDMI-0 --mode 3440x1440 --rate 99.99 &
nitrogen --restore; sleep 1; picom -b
clipit &
fcitx &
imwheel -b 45 &
nm-applet &
pamac-tray &
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
/usr/lib/xfce4/notifyd/xfce4-notifyd &
ff-theme-util &
setcursor &
