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
suso mkdir /home/pi/Music

# download repository and distribute files
sudo git clone https://github.com/ghostbusker/GhostBoy

cd GhostBoy

# move custom config files and scripts to SD card
sudo mv rc /home/pi/.config/cmus
sudo mv ghostboy.theme /home/pi/.config/cmus/
sudo mv xboxdrv.cfg /home/pi/.config/
sudo mv dpi24.dtbo /boot/overlays/
sudo mv pwm-audio-pi-zero.dtbo /boot/overlays/
sudo mv config.txt /boot/
sudo mv BuskPod.sh /home/pi/

# set permissions, could be trouble otherwise
sudo chown pi:pi /home/pi/*

# enable ssh
sudo raspi-config nonint do_ssh 0

# avoid wait for network on boot
sudo raspi-config nonint do_boot_wait 1

# boot to shell and log-in as pi
sudo raspi-config nonint do_boot_behaviour B2

# make music player script executable
sudo chmod +x /home/pi/BuskPod.sh

# finally, add our music player script to run on log-in 
echo "bash /home/pi/BuskPod.sh" >> /home/pi/.profile


# set hostname
sudo hostname BuskPod

# setup samba share for /home/pi/Music folder on network for adding songs
sudo apt install samba samba-common-bin


# add shared folder to /etc/samba/smb.conf config file
sudo cat <<END >> /etc/samba/smb.conf
wins support = yes
[BuskPod]
   comment=BuskPod Music Share
   path=/home/pi/Music
   browseable=Yes
   writeable=Yes
   only guest=no
   create mask=0777
   directory mask=0777
   public=yes
END

# set pi user password as default SMB share password
sudo smbpasswd -a pi


# BOOT DIRECTLY TO TERMINAL
# DISABLE WAIT FOR NETWORK ON BOOT

# add custom boot animation, backgrounds, and graphics
# add tmux and vis to provide a real-time eq effect?
# run i3 wm and show multiple pages of info
# sound quality is passable but in need of upgrade, consider using pcm5102 DAC module (headphone amp needed) for audio