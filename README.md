# Dotfile for dwm autostart

dwm can be equipped with an autostart function, which run commands before enter the handler loop:

```
$ ~/.dwm/autostart_blocking.sh
$ ~/.dwm/autostart.sh &
```

## Requirements

This file is created to serve the dwm from [here](https://github.com/lazypool/dwm) or any dwm with autostart patch.

So please ensure that the dwm with autostart patch has been installed before you attempt to use this project.

Except dwm, other pkgs are also needed for the extral functions:

- xwinwarp
- mplayer
- picom
- fcitx5

## Installation

Assuming you have installed the dwm and applied an autostart patch to it, all you need is to clone this project under $HOME:

```
$ cd $HOME
$ git clone https://github.com/lazypool/.dwm.git
```

Restart your dwm and then it should be able to work.

However, the volume setting is still disabled, please refer to "Volume setting" for details.

## Functions

### Keyboards map

dwm won't run before autostart\_blocking.sh exits, hence we can only write programs that will automatically exit here.

I put my keyboards map at this file naturally:

```
setxkbmap -layout us -variant colemak -option -option caps:swapescape -option lv3:ralt_alt
```

### Os info print

autostart.sh will call dwm\_refresh.sh and print infomation of computer on dwm bar, such as datetime, battery and volume.

### Video wall

autostart.sh will call videowall.sh and display video at background to realize the dynamic wallpaper.

All videos are saved in videos/, please feel free to add or delete them.

To change video displayed, you need to do a little change to the videowall.sh.

### Picom render

autostart.sh will call the picom function.

You should copy the conf to $HOME/.conf/picom/picom.conf

```
$ cp picom/picom.conf $HOME/.config/picom/picom.conf
```

You can also customize the conf as you like.

### Chinese input

The chinese input is supported by fcitx5, which will be called by autostart.sh.

It's recommended to set the following environment variables in /etc/environment:

```
GTK_IM_MODULE=fcitx
QT_IM_MODULE=fcitx
XMODIFIERS=@im=fcitx
SDL_IM_MODULE=fcitx
GLFW_IM_MODULE=ibus
```

### Volume setting

Normally the dwm don't support the shortcut keys to set volume.

Feel free to skip this section if you're not using the dwm from [here](https://github.com/lazypool/dwm)

lazypools' build of dwm uses the 'MODKEY + Shift + ]' to increase volume and 'MODKEY + Shift + [' to reduce volume.

You just need to copy the increasevolume.sh and reducevolume.sh to bin:

```
$ sudo cp increasevolume.sh /bin/increasevolume
$ sudo cp reducevolume.sh /bin/reducevolume
```
