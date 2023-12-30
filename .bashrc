#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

## some env variables
export EDITOR='/usr/bin/nvim'
export GIT_EDITOR='/usr/bin/nvim'

## my aliases
alias home='cd ~/'
alias v='/usr/bin/nvim'
alias ls='ls --color=auto'
alias grep='grep --color=auto'


PS1='[\u@\h \W]\$ '

# Import colorscheme from 'wal' asynchronously
# &   # Run the process in the background.
# ( ) # Hide shell job control messages.
# Not supported in the "fish" shell.
(cat ~/.cache/wal/sequences &)

# Alternative (blocks terminal for 0-3ms)
cat ~/.cache/wal/sequences

# To add support for TTYs this line can be optionally added.
source ~/.cache/wal/colors-tty.sh
