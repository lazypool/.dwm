#!/bin/bash

/usr/bin/amixer -qM set Master 5%+ umute
/bin/bash $HOME/.dwm/dwm_refresh.sh
