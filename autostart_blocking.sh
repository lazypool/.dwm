#!/bin/bash

export DWM=$(cd $(dirname $0);pwd)

setxkbmap -layout us -variant colemak -option -option caps:swapescape -option lv3:ralt_alt

fcitx5 -d
