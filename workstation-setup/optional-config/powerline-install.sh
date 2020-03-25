#!/bin/bash

sudo pacman -S powerline powerline-vim

cd /opt/AUR
git clone https://github.com/powerline/fonts.git

sudo cp -r fonts/Inconsolata /usr/share/fonts/
sudo cp -r fonts/DejaVuSansMono /usr/share/fonts/

sudo xset +fp /usr/share/fonts/Inconsolata
sudo xset +fp /usr/share/fonts/DejaVuSansMono

xset +fp /usr/share/fonts/Inconsolata
xset +fp /usr/share/fonts/DejaVuSansMono


cd /usr/share/fonts/Inconsolata
fc-cache
sudo fc-cache

cd /usr/share/fonts/DejaVuSansMono
fc-cache
sudo fc-cache


cat << 'EOF' >> ~/.bashrc

powerline-daemon -q
POWERLINE_BASH_CONTINUATION=1
POWERLINE_BASH_SELECT=1
. /usr/share/powerline/bindings/bash/powerline.sh

EOF


# add urxvt font settings:
#urxvt*font: xft:DejaVu\ Sans\ Mono\ for\ Powerline:pixelsize=14:autohint=true:antialias=false


# add to top of .vimrc
#set rtp+=/usr/lib/python3.8/site-packages/powerline/bindings/vim
#set laststatus=2
#set noshowmode
#set showtabline=2


# add to top of .zshrc
#powerline-daemon -q
#. /usr/lib/python3.8/site-packages/powerline/bindings/zsh/powerline.zsh

# add fonts
#sudo xset +fp /usr/share/fonts/OTF
#cd /usr/share/fonts/OTF
#sudo fc-cache


