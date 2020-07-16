#!/bin/bash

nohup sudo rmmod xpad &>/dev/null &
nohup sudo xboxdrv --detach-kernel-driver --silent --quiet --config /home/pi/.config/xboxdrv.cfg &>/dev/null &
xterm -e cmus --show-cursor
cmus-remote -l "/home/pi/Music"

