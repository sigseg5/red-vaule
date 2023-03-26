#!/usr/bin/env bash
set -e

echo "Install Xfce4 UI components"
apt-get install -y supervisor xfce4 xfce4-terminal xterm dbus-x11 libdbus-glib-1-2
apt-get purge -y pm-utils *screensaver*
