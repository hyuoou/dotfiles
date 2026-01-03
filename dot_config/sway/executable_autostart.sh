#!/usr/bin/env bash

fcitx5 &
nm-applet &
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
/usr/bin/gnome-keyring-daemon --start --components=secrets &
blueman-applet &
