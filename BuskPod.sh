#!/bin/bash

sudo xboxdrv --detach-kernel-driver --silent --quiet --config /home/pi/.config/xboxdrv.cfg &
exec sudo cmus --show-cursor 
sleep 5s
sudo cmus-remote -l "/home/pi/Music"
