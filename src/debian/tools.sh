#!/usr/bin/env bash
set -e

echo "Install some common tools for further installation"
apt-get install -y vim wget net-tools locales bzip2 procps \
    python3-numpy ca-certificates libnss3-tools zip nano curl cmake python3-pip pkg-config

# Update vulnerable pip packages
pip3 install --upgrade certifi idna requests setuptools supervisor urllib3 chardet pip numpy wheel

echo "generate locales for en_US.UTF-8"
locale-gen en_US.UTF-8

# Install libnss for rootless environment support

apt-get install -y libnss-wrapper gettext

echo "add 'source generate_container_user' to .bashrc"

# have to be added to hold all env vars correctly
echo 'source $STARTUPDIR/generate_container_user' >>$HOME/.bashrc
