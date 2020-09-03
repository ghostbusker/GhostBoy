#!/bin/bash

# setup XBOX controller mappings to keyboard
nohup sudo rmmod xpad &>/dev/null &
nohup sudo xboxdrv --detach-kernel-driver --silent --quiet --config /home/pi/.config/xboxdrv.cfg &>/dev/null &

### launch each "app" with a special title that gets its own screen (workspace)

#WS1 Music
exec xterm -xrm 'XTerm.vt100.allowTitleOps: false' -T "cmus" -e cmus --show-cursor
exec cmus-remote -l "/home/pi/Music"
i3-msg assign [title="cmus"] $ws1

#WS2 Weather
#fetch a new weather image every 15 minutes and rename it weather.png
exec watch -n 900 wget -O /tmp/weather.png https://s.w-x.co/staticmaps/wu/wxtype/county_loc/csg/animate.png
#exec xterm -e bash ~/.config/scripts/weather.sh
exec mpv --loop --no-osc --background=0/0/0/0 --framedrop=vo /tmp/weather.png
i3-msg assign [class="mpv"] $ws2

#WS3 News / time
exec xterm -xrm 'XTerm.vt100.allowTitleOps: false' -T "tty-clock" -e "tty-clock -nsxB"
i3-msg assign [title="tty-clock"] $ws3

#WS4 Ranger
exec xterm -xrm 'XTerm.vt100.allowTitleOps: false' -T "ranger" -e "ranger"
i3-msg assign [title="ranger"] $ws4

#WS5 Games
exec xterm -xrm 'XTerm.vt100.allowTitleOps: false' -T "htop" -e "htop"
i3-msg assign [title="htop"] $ws5

#WS6 Movies
exec xterm -xrm 'XTerm.vt100.allowTitleOps: false' -T "cmatrix" -e "cmatrix -ab -C magenta"
i3-msg assign [title="cmatrix"] $ws6
