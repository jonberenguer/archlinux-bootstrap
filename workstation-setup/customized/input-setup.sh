#!/bin/bash

sudo pacman -S --noconfirm xbindkeys xorg-xbacklight
sudo pacman -S --noconfim xautomation xorg-xev

# tips for xinput
# xinput #returns list of input devices
# xinput --disable <id>
# xinput --enable <id>


# results from xbindkeys --key
# add xbindkeys in .xprofile

cat << EOF >> ~/.xprofile
xbindkeys
EOF

