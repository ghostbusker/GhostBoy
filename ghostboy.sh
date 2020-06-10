#!/bin/bash
# ghostbusker's GhostBoy BuskPod installer

sudo apt update
#sudo apt dist-upgrade
sudo apt -y install git
sudo apt -y install cmus
sudo git clone https://github.com/ghostbusker/BuskPod
cd BuskPod
sudo mv ghostboy.theme ~/.config/cmus/
sudo mv xboxdrv.cfg ~/.config/
sudo mkdir ~/Music
sudo cmus -add ~/Music/


