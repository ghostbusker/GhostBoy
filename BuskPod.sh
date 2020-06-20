#!/bin/bash

nohup sudo rmmod xpad &>/dev/null &
nohup sudo xboxdrv --detach-kernel-driver --silent --quiet --config /home/pi/.config/xboxdrv2.cfg &>/dev/null &
( sleep 3; cmus-remote -l "/home/pi/Music" ) &
cmus --show-cursor
