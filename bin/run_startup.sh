#!/bin/bash

stalonetray &
fcitx5 &
# ibus-daemon -d
dropbox start
# /usr/bin/blueman-applet &

tzclock &

# スクリーン系の管理
xset -dpms
xset s noblank

# compton -b --config $HOME/.config/compton/compton.conf
picom -b --config /home/minamo/picom.conf &

feh --bg-fill --randomize /home/minamo/Pictures/*.jpg

