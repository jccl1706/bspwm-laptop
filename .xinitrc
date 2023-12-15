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
#exec feh --bg-scale ~/.config/wallpapers/winter-wall2.png &

## policy
#exec /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &

## start bspwm
exec bspwm
