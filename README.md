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

dwm won't run before autostart_blocking.sh exits, hence we can only write programs that will automatically exit here.

I put my keyboards map at autostart_blocking.sh like this:

```
setxkbmap -layout us -variant colemak -option -option caps:swapescape -option lv3:ralt_alt
```

### Chinese input

The chinese input is supported by fcitx5, which will also be called by autostart_blocking.sh.

Running fcitx5 will change keyboard map by default, so you need to use 'fcitx5-config-qt' to configure.

To configure, the 'Allow Overriding System XKB Settings' must be unchecked.

```
fcitx5 -d
```

It's recommended to set the following environment variables in /etc/environment:

```
GTK_IM_MODULE=fcitx
QT_IM_MODULE=fcitx
XMODIFIERS=@im=fcitx
SDL_IM_MODULE=fcitx
GLFW_IM_MODULE=ibus
```

### Os info print

autostart.sh will call dwm_refresh.sh and print infomation of computer on dwm bar, such as datetime, battery and volume.

```
exec -a dwm_refresh $DWM/dwm_refresh.sh &
```

### Video wall

autostart.sh will call videowall.sh and display video at background to realize the dynamic wallpaper.

```
exec -a videowall $DWM/videowall.sh &
```

All videos are saved in videos/, please feel free to add or delete them.

To change video displayed, you need to do a little change to the videowall.sh.

```
# The Video Name/Path
name="01fructose.mp4"
path="$DWM/videos/$name"
```

### Picom render

autostart.sh will call the picom function.

```
picomconf="$DWM/picom/picom.conf"
exec -a picom picom --experimental-backends --backend glx --config $picomconf &
```

You can customize the conf file as you like.

### Volume setting

Normally the dwm don't support the shortcut keys to set volume.

Feel free to skip this section if you're not using the dwm from [here](https://github.com/lazypool/dwm)

lazypool's build of dwm uses the 'MODKEY + Shift + ]' to increase volume and 'MODKEY + Shift + [' to reduce volume.

You just need to copy the increasevolume.sh and reducevolume.sh to bin:

```
$ sudo cp increasevolume.sh /bin/increasevolume
$ sudo cp reducevolume.sh /bin/reducevolume
```
