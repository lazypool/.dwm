#!/bin/bash

export DWM=$(cd $(dirname $0);pwd)

# print status on bar
source $DWM/dwm_refresh.sh &

# activate dynamic wallpaper
source $DWM/videowall.sh &

# enable picom
picomconf="$HOME/.config/picom/picom.conf"
picom --experimental-backends --backend glx --config $picomconf &
