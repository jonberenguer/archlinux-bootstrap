#!/bin/bash

sudo pacman -S --noconfirm zathura zathura-pdf-mupdf

mkdir -p $HOME/.config/zathura
cat << 'EOF' >> $HOME/.config/zathura/zathurarc
set selection-clipboard clipboard
EOF

# add to bspcrc file
# bspc rule -a Zathura rectangle=1280x1280+640+100
