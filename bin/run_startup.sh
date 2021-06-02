#!/bin/bash

stalonetray &
dropbox start
/usr/bin/blueman-applet &

compton -b --config $HOME/.config/compton/compton.conf

feh --bg-fill --randomize /home/minamo/Pictures/*.jpg

