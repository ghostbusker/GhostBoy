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
sudo apt -y install git cmus xboxdrv lolcat figlet cmatrix feh compton mpv nemo samba samba-common-bin

# download repository and distribute files
sudo git clone https://github.com/ghostbusker/GhostBoy

cd GhostBoy

# generate directories before adding files
sudo mkdir /home/pi/.config
sudo mkdir /home/pi/.config/cmus
sudo mkdir /home/pi/.config/i3
sudo mkdir /home/pi/Music

# move custom config files and scripts to SD card
sudo mv .config/cmus/rc /home/pi/.config/cmus
sudo mv .config/cmus/ghostboy.theme /home/pi/.config/cmus/
sudo mv .config/i3/config /home/pi/.config/i3/
sudo mv .config/i3status/config /home/pi/.config/i3status/
sudo mv .config/compton.conf /home/pi/.config/
sudo mv .config/xboxdrv.cfg /home/pi/.config/
sudo mv .config/xboxdrv2.cfg /home/pi/.config/

sudo mv boot/overlays/dpi24.dtbo /boot/overlays/
sudo mv boot/overlays/pwm-audio-pi-zero.dtbo /boot/overlays/
sudo mv boot/config.txt /boot/

sudo mv BuskPod.sh /home/pi/

# set permissions, could be trouble otherwise
sudo chown pi:pi /home/pi/*
sudo chown pi:pi /home/pi/.*

# enable ssh
sudo raspi-config nonint do_ssh 0

# boot to shell and log-in as pi
sudo -u pi raspi-config nonint do_boot_behaviour B2

# avoid wait for network on boot
sudo raspi-config nonint do_boot_wait 1

# make music player script executable
sudo chmod +x /home/pi/BuskPod.sh

# finally, add our music player script to run on log-in 
#echo "bash /home/pi/BuskPod.sh" >> /home/pi/.profile

# instead, go straight to desktop after login 
echo "startx" >> /home/pi/.profile

# set hostname
sudo hostname BuskPod

desktopFromScratch () {
  echo "installer: installing graphical desktop environment"
  sudo apt -yq install xorg xserver-xorg xinit git cmake lxappearance
  echo "installing i3-gaps window manager from source"
  cd /opt/ 
  sudo apt -yq install i3 gcc make autoconf dh-autoreconf libxcb-keysyms1-dev libpango1.0-dev libxcb-util0-dev xcb libxcb1-dev \
  libxcb-icccm4-dev libyajl-dev libev-dev libxcb-xkb-dev libxcb-cursor-dev libxkbcommon-dev libxcb-xinerama0-dev \
  libxkbcommon-x11-dev libstartup-notification0-dev libxcb-randr0-dev libxcb-xrm0 libxcb-xrm-dev libxcb-shape0 libxcb-shape0-dev
  sudo git clone https://www.github.com/Airblader/i3 i3-gaps
  cd i3-gaps
  sudo autoreconf --force --install
  sudo rm -rf build/
  sudo mkdir -p build 
  cd build/
  sudo ../configure --prefix=/usr --sysconfdir=/etc --disable-sanitizers
  sudo make -j8
  sudo make install
}

desktopFromScratch

scrapeWallpapers() { # this whole module not working
  echo "installer: scraping wallpapers from the web" #shamelessly
  sudo mkdir /home/pi/Pictures/
  sudo mkdir /home/pi/Pictures/Wallpapers
  cd /home/pi/Pictures/Wallpapers
  sudo wget https://cdn.clipart.email/ea453281dbdec70a2bf5b70464f41e4f_desert-sand-background-gallery-yopriceville-high-quality-_5500-3667.jpeg
  sudo wget http://getwallpapers.com/wallpaper/full/2/2/3/702223-free-rainforest-backgrounds-2560x1440.jpg
  sudo wget http://getwallpapers.com/wallpaper/full/9/d/6/702176-rainforest-backgrounds-1920x1080-for-mac.jpg
  sudo wget http://getwallpapers.com/wallpaper/full/8/0/e/702147-rainforest-backgrounds-2560x1600-images.jpg
  sudo wget http://getwallpapers.com/wallpaper/full/e/8/7/702136-rainforest-backgrounds-1920x1080-for-mobile.jpg
  sudo wget http://getwallpapers.com/wallpaper/full/a/6/e/702131-beautiful-rainforest-backgrounds-1920x1080-for-iphone-6.jpg
  sudo wget http://getwallpapers.com/wallpaper/full/a/a/9/702126-rainforest-backgrounds-2560x1600-for-computer.jpg
  sudo wget --output-document=77d851d65c43.jpg https://images.unsplash.com/photo-1518965539400-77d851d65c43
  sudo wget --output-document=e29b079736c0.jpg https://images.unsplash.com/photo-1565138146061-e29b079736c0
  sudo wget --output-document=afa90b13e000.jpg https://images.unsplash.com/photo-1516528387618-afa90b13e000
  sudo wget --output-document=7d1092d8c6c6.jpg https://images.unsplash.com/photo-1428572184420-7d1092d8c6c6
  sudo wget --output-document=ef046c08a56e.jpg https://images.unsplash.com/photo-1497250681960-ef046c08a56e
  sudo wget --output-document=e0475b1856c4.jpg https://images.unsplash.com/photo-1580630873708-e0475b1856c4
  sudo wget --output-document=9da59a9b1fef.jpg https://images.unsplash.com/photo-1518058488548-9da59a9b1fef
  sudo wget --output-document=7706220a65f6.jpg https://images.unsplash.com/photo-1570828066702-7706220a65f6
  sudo wget --output-document=c7d3dc332654.jpg https://images.unsplash.com/photo-1495527400402-c7d3dc332654
  sudo wget --output-document=36f6e462f56d.jpg https://images.unsplash.com/photo-1515615575935-36f6e462f56d
  sudo wget --output-document=5ec7c8c8e1a6.jpg https://images.unsplash.com/photo-1524207874394-5ec7c8c8e1a6
  sudo wget --output-document=821febf1275c.jpg https://images.unsplash.com/photo-1548759806-821febf1275c
  sudo wget --output-document=0b7889e0f147.jpg https://images.unsplash.com/photo-1547499417-0b7889e0f147
  sudo wget --output-document=b498b3fb3387.jpg https://images.unsplash.com/photo-1569429593410-b498b3fb3387
  sudo wget --output-document=580b10ae7715.jpg https://images.unsplash.com/photo-1504548840739-580b10ae7715
  sudo wget --output-document=53a374d2d2e1.jpg https://images.unsplash.com/photo-1563836728031-53a374d2d2e1
  sudo wget --output-document=208c53a23c2a.jpg https://images.unsplash.com/photo-1556331968-208c53a23c2a
  sudo wget --output-document=80a3466b13fe.jpg https://images.unsplash.com/photo-1564565562150-80a3466b13fe
  sudo wget --output-document=5ae24d986629.jpg https://images.unsplash.com/photo-1561622481-5ae24d986629
  sudo wget --output-document=fb52f37ba73c.jpg https://images.unsplash.com/photo-1544481921-fb52f37ba73c
  sudo wget --output-document=f0e5c91fa707.jpg https://images.unsplash.com/photo-1527409335569-f0e5c91fa707
  sudo wget --output-document=b24cf25c4a36.jpg https://images.unsplash.com/photo-1472145246862-b24cf25c4a36
}

scrapeWallpapers

# add shared folder to /etc/samba/smb.conf config file
sudo cat <<END >> /etc/samba/smb.conf
wins support = yes
[BuskPod]
   comment = BuskPod Music Share
   path = /home/pi/Music
   browseable = yes
   writeable = yes
   read only = no
   guest ok = yes
#   only guest = no
#   create mask = 0777
#   directory mask = 0777
   public = yes
END

# set pi user password as default SMB share password
#sudo smbpasswd -a pi


# BOOT DIRECTLY TO TERMINAL
# DISABLE WAIT FOR NETWORK ON BOOT

# add custom boot animation, backgrounds, and graphics
# add tmux and vis to provide a real-time eq effect?
# run i3 wm and show multiple pages of info
# sound quality is passable but in need of upgrade,
# conside rusing pcm5102 DAC module (headphone amp needed) for audio