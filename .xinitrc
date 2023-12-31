#!/bin/bash
#

[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

## -R restores the last colorscheme that was in use.
wal -R

## my scripts folder
export PATH="$HOME/.config/.scripts:$PATH"
export PATH="$HOME/.config/bspwm/scripts:$PATH"

## set gtk theme
#export GTK_THEME='Catppuccin-Macchiato-Standard-Mauve-Dark:dark'

## start bspwm
exec bspwm
