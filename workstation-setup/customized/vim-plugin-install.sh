#!/bin/bash

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim


cat << 'EOF' >> ~/.vimrc
call plug#begin('~/.vim/plugged')

Plug 'ervandew/supertab'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'junegunn/limelight.vim'
Plug 'ctrlpvim/ctrlp.vim'

call plug#end()
EOF

# in vim to install plug ins
# :source %
# :PlugInstall


