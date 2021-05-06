#!/bin/sh

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
export LANGUAGE=zh_CN:en_US &
export GTK_IM_MODULT=ibus
export QT_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
while xsetroot -name "Battery:$(acpi -b | awk '{print $4}' | cut -d"," -f1)|Volume:$(amixer get Master | awk -F'[][]' 'END{ print $4":"$2  }'    )|$(LC_ALL='C' date +'%F[%b %a] %R')"
do
    sleep 1
done &
ibus-daemon -drx &
picom -CGb &
export _JAVA_AWT_WM_NONREPARENTING=1
exec $1
wmname LG3D
while habak -ms -hi ~/.config/desktop/wallpaper/
do
    sleep 600
done &
qv2ray &
nm-applet &
xfce4-power-manager &
exec dwm
else
 exec $command
fi
