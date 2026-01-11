#!/usr/bin/env bash

fcitx5 &
nm-applet &
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
/usr/bin/gnome-keyring-daemon --start --components=secrets &
blueman-applet &
swaync &
wl-paste --type text --watch cliphist store -max-items 100 &
wl-paste --type image --watch cliphist store &
hash dbus-update-activation-environment 2>/dev/null &&
  dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP=sway &
./import-gsettings.sh \
  gtk-theme:Matcha-dark-azul \
  icon-theme:Papirus-Dark \
  cursor-theme:Breeze5 &
spotify &
thunderbird &
