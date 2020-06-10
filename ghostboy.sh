#!/bin/bash
# ghostbusker's GhostBoy BuskPod installer

#set localization
TIMEZONE=US/Eastern
LOCALE=en_US.UTF-8
LAYOUT=us   #keyboard
WIFICOUNTRY=US

sudo timedatectl set-timezone $TIMEZONE
sudo raspi-config nonint do_change_locale $LOCALE
sudo raspi-config nonint do_configure_keyboard $LAYOUT
sudo raspi-config nonint do_wifi_country $WIFICOUNTRY
export LANGUAGE=$LOCALE
export LANG=$LOCALE
export LC_ALL=$LOCALE
sudo locale-gen $LOCALE
sudo dpkg-reconfigure localeslocale-gen $LOCALE


# update package list
sudo apt update

# upgrade all included apps
#sudo apt dist-upgrade

# install needed apps
sudo apt -y install git
sudo apt -y install cmus
sudo apt -y install xboxdrv


# generate directories before adding files
sudo mkdir /home/pi/.config
sudo mkdir /home/pi/.config/cmus

# download repository and distribute files
sudo git clone https://github.com/ghostbusker/GhostBoy

cd GhostBoy

sudo mv rc /home/pi/.config/cmus
sudo mv ghostboy.theme /home/pi/.config/cmus/
sudo mv xboxdrv.cfg /home/pi/.config/
sudo mv dpi24.dtbo /boot/overlays/
sudo mv pwm-audio-pi-zero.dtbo /boot/overlays/
sudo mv config.txt /boot/
sudo mv BuskPod.sh /home/pi/

# enable ssh
sudo raspi-config nonint do_ssh 0

# avoid wait for network on boot
sudo raspi-config nonint do_boot_wait 1

# boot to shell and log-in as pi
sudo raspi-config nonint do_boot_behaviour B2

# finally, add our music player script to run on log-in 
echo "bash /home/pi/BuskPod.sh" >> /home/pi/.profile
