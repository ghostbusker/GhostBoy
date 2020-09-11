# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi
#startx
#./home/pi/.config/scripts/buskpod.sh

sudo rmmod xpad &>/dev/null &
sudo xboxdrv --detach-kernel-driver --silent --quiet --config /home/pi/.config/xboxdrv.cfg --ui-buttonmap back+start=exec:/home/pi/.config/scripts/safe_shutdown.sh &>/dev/null &

#nohup xboxdrv --ui-axismap back+start=exec:"/home/pi/.config/scripts/safe_shutdown.sh"

eval 'resize'

function advancedMenu() {
    ADVSEL=$(whiptail --title "Advanced Menu" \
    --fb --menu "Choose your adventure: " $LINES $COLUMNS $(( $LINES - 8 )) \
        "1" "Music" \
        "2" "Podcasts" \
        "3" "Games" \
        "4" "Reboot" \
        "5" "Shutdown" \
	"6" "Exit Menu" 3>&1 1>&2 2>&3)
    case $ADVSEL in
        1)
            #echo "Option 1"
            #whiptail --title "Option 1" --msgbox "You chose option 1. Exit status $?" 8 45
	    cmus
        ;;
        2)
            #echo "Option 2"
            #whiptail --title "Option 1" --msgbox "You chose option 2. Exit status $?" 8 45
            castero
        ;;
        3)
            #echo "Option 3"
            #whiptail --title "Option 1" --msgbox "You chose option 3. Exit status $?" 8 45
            echo games
        ;;
        4)
            #echo "Option 4"
            sudo reboot
        ;;
        5)
            #echo "Option 5"
            sudo shutdown now
	;;
	6)
	    #echo "Option 6"
	    echo "goodbye!"
	    exit
    esac
}

advancedMenu

