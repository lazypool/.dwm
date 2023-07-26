#!/bin/bash

# The Video Name/Path
name="Coffee"
path="$HOME/Wallpaper/DynamicWall/$name"

if [ ! -d "/tmp/wallpaper" ];then
	mkfifo /tmp/wallpaper
fi

xwinwrap -fs -nf -ov -- \
mplayer -shuffle -slave -af volume=-200 \
	-input file=/tmp/wallpaper \
	-loop 0 -wid WID -nolirc $path
