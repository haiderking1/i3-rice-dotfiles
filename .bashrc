#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias nautilus='dbus-launch nautilus'
PS1='[\u@\h \W]\$ '

# GTK Dark Theme
export GTK_THEME=Adwaita:dark

# Show fastfetch on terminal startup
fastfetch
