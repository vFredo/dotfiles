#!/bin/sh

# Composer and wallpaper
feh --bg-scale ~/Pictures/city.jpg

# --experimental-backends --vsync
# should prevent screen tearing on most setups if needed
picom & disown

# Low battery notifier
~/.config/qtile/scripts/check_battery.sh & disown

# Start welcome
eos-welcome & disown

# start polkit agent from GNOME
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 & disown
