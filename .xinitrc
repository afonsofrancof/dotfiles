#!/bin/sh

export XDG_SESSION_TYPE=x11
export XDG_CURRENT_DESKTOP=X-Generic
userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi
if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi
if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi
if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

. $HOME/.local/bin/desktopres


# Don't forget to run this command
#localectl set-x11-keymap us,pt pc104 , grp:alt_space_toggle,caps:escape

# These are backup
#setxkbmap -layout us,pt
#setxkbmap -option grp:alt_space_toggle
#setxkbmap -option caps:escape
xset r rate 300 40

. $ZDOTDIR/.zshenv

exec /home/afonso/.local/bin/xmonad
