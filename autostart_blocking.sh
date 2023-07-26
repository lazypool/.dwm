#!/bin/bash

fcitx5 -d

sleep 0.05

setxkbmap -layout us -variant colemak -option -option caps:swapescape -option lv3:ralt_alt
