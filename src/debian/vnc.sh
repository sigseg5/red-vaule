#!/usr/bin/env bash
set -e

echo "Install TigerVNC server"
apt-get install -y tigervnc-standalone-server
printf '\n# docker-demahck-container:\n$localhost = "no";\n1;\n' >>/etc/tigervnc/vncserver-config-defaults

set -u

echo "Installing noVNC viewer"
mkdir -p $NO_VNC_HOME/utils/websockify
wget -qO- https://github.com/novnc/noVNC/archive/refs/tags/v1.4.0.tar.gz | tar xz --strip 1 -C $NO_VNC_HOME
wget -qO- https://github.com/novnc/websockify/archive/refs/tags/v0.11.0.tar.gz | tar xz --strip 1 -C $NO_VNC_HOME/utils/websockify

## create index.html to forward automatically to `vnc_lite.html`
ln -s $NO_VNC_HOME/vnc_lite.html $NO_VNC_HOME/index.html
