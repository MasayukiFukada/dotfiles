#!/bin/bash

stalonetray &
dropbox start

compton -b --config $HOME/.config/compton/compton.conf

