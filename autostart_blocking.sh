#!/bin/bash

export DWM=$(cd $(dirname $0);pwd)

feh --bg-scale $DWM/videos/01fructose.jpg

fcitx5 -d

state=$(fcitx5-remote)
while(( $state == 0 ))
do
	state=$(fcitx5-remote)
done

setxkbmap -layout us -variant colemak -option -option caps:swapescape -option lv3:ralt_alt
