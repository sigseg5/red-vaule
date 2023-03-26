#!/usr/bin/env bash
set -e

echo -e "\n------------------ startup of Xfce4 window manager ------------------"

### disable screensaver and power management
xset -dpms &
xset s noblank &
xset s off &

mkdir ~/.config/autostart
cp ~/Desktop/chromium-browser.desktop ~/.config/autostart

/usr/bin/startxfce4 --replace >$HOME/wm.log &
sleep 1
cat $HOME/wm.log
