#!/bin/bash

export DWM=$(cd $(dirname $0);pwd)

# print status on bar
exec -a dwm_refresh $DWM/dwm_refresh.sh &

# activate dynamic wallpaper
feh --bg-fill $DWM/pictures/01me.jpg &
#exec -a videowall $DWM/videowall.sh &

# enable picom
picomconf="$DWM/picom/picom.conf"
exec -a picom picom --experimental-backends --backend glx --config $picomconf &

# start clash
exec -a clash clash -f $HOME/.config/clash/download.yml
