xrdb -merge $HOME/.Xresources

vmware-user-suid-wrapper
setxkbmap -model jp106 -layout jp
xcompmgr &
urxvtd -q -o -f
ibus-daemon -d -x -r
exec awesome
