#!/usr/bin/env bash
set -e

echo "Install Chromium Browser"
apt-get install -y chromium
ln -sfn /usr/bin/chromium /usr/bin/chromium-browser
