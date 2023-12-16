#!/bin/bash
#

[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

## my scripts folder
export PATH="$HOME/.config/.scripts/:$PATH"
export PATH="$HOME/.config/bspwm/scripts:$PATH"

## prime GPU
#export

## set gtk theme
#export GTK_THEME='Catppuccin-Macchiato-Standard-Mauve-Dark:dark'

## set wallpaper
#exec feh --bg-scale ~/.config/wallpapers/moon-evening-sky.jpg &

## policy
#exec /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &

## disable xauth
# enable_xauth=0

## start bspwm
exec bspwm
