#!/bin/bash

sudo xboxdrv &
sudo xboxdrv --detach-kernel-driver --silent --quiet --config /home/pi/.config/xboxdrv.cfg &
( sleep 3s ; cmus-remote -l "/home/pi/Music" ) &
exec cmus --show-cursor
