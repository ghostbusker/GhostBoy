#!/bin/bash

xboxdrv > /dev/null 2>&1 \
	--detach-kernel-driver \
	--silent \
	--quiet \
	--dpad-as-button \

	--ui-axismap x1=KEY_LEFT:KEY_RIGHT \
	--ui-axismap y1=KEY_UP:KEY_DOWN \
	
	--ui-buttonmap a=KEY_A \
	--ui-buttonmap b=KEY_B \
	--ui-buttonmap x=KEY_X \
	--ui-buttonmap y=KEY_Y \
	--ui-buttonmap lb=KEY_L \
	--ui-buttonmap rb=KEY_R \
	--ui-buttonmap back=KEY_LEFTMETA:BTN_ \
	--ui-buttonmap start=KEY_SPACE \
	
	--ui-buttonmap back+start+y+x+b+a=exec:"/home/pi/.config/scripts/safe_shutdown.sh" \
	
--next-config
	--mouse\


  --ui-buttonmap A^toggle=JS_0