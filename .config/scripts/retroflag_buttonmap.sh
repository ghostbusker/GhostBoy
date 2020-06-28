#!/bin/bash

xboxdrv \
	--detach-kernel-driver \
	--dpad-as-button \
	--ui-axismap x1=KEY_LEFT:KEY_RIGHT \
	--ui-axismap y1=KEY_UP:KEY_DOWN \
	--ui-buttonmap a=KEY_A:KEY_1:1000 \
	--ui-buttonmap b=KEY_B:KEY_2:1000 \
	--ui-buttonmap x=KEY_X:KEY_3:1000 \
	--ui-buttonmap y=KEY_Y:KEY_4:1000 \
	--ui-buttonmap lb=KEY_L:KEY_5:1000 \
	--ui-buttonmap rb=KEY_R:KEY_6:1000 \
	--ui-buttonmap back=KEY_LEFTMETA:KEY_7:1000 \
	--ui-buttonmap start=KEY_SPACE:KEY_8:1000 \
--next-config \
	--mouse
