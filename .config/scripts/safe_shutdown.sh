#!/bin/bash

RET=$(echo -e "shutdown\nreboot\ncancel" | dmenu -l 5 -p "Cancel")

case $RET in
	shutdown) sudo shutdown now ;;
	reboot) sudo reboot ;;
	*) ;;
esac