#!/bin/bash

# Set up a trap to catch errors
trap 'catch' ERR
catch() {
  echo "An error has occurred"
  exit 0
}

xfconf-query -c xfce4-desktop --create -p /desktop-icons/file-icons/show-home -t bool -s false
xfconf-query -c xfce4-desktop --create -p /desktop-icons/file-icons/show-removable -t bool -s false
xfconf-query -c xfce4-desktop --create -p /desktop-icons/file-icons/show-trash -t bool -s false
xfconf-query -c xfce4-desktop --create -p /desktop-icons/file-icons/show-filesystem -t bool -s false

exit 0
