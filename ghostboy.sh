#!/bin/bash
# ghostbusker's GhostBoy BuskPod installer

sudo touch /boot/ssh

sudo apt update
#sudo apt dist-upgrade
sudo apt -y install git
sudo apt -y install cmus
sudo git clone https://github.com/ghostbusker/GhostBoy
cd GhostBoy
sudo mv ghostboy.theme ~/.config/cmus/
sudo mv xboxdrv.cfg ~/.config/
sudo mv dpi24.dtbo /boot/overlays/
sudo mv pwm-audio-pi-zero.dtbo /boot/overlays/
sudo mv config.txt /boot/
sudo mkdir ~/Music
#sudo cmus -add ~/Music/


# add the following lines to /etc/rc.local BEFORE the line "exit 0"
# xboxdrv --disable-kenel-driver --config ~/.config/xboxdrv.cfg &
# cmus --show-cursor
