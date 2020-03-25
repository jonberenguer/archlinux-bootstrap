#!/bin/bash

sudo pacman -S zsh zsh-completions zsh-autosuggestions

cat << 'EOF' > ~/.zshrc


export PATH=$PATH:$HOME/opt:$HOME/.local/bin

powerline-daemon -q
. /usr/lib/python3.8/site-packages/powerline/bindings/zsh/powerline.zsh

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

echo -e "\033[5 q"

bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall

#zstyle :compinstall filename '/home/user/.zshrc'

autoload -Uz compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
#_comp_options+=(globdots) # show hidden

# End of lines added by compinstall

if [ -f ~/.aliases ]; then
  source $HOME/.aliases
fi



source /opt/AUR/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh > /dev/null
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh 2>/dev/null

EOF





cd /opt/AUR
git clone https://aur.archlinux.org/zsh-syntax-highlighting-git.git
cd zsh-syntax-highlighting-git
makepkg -si


# change user default shell
# cat /etc/shells
# sudo usermod --shell /usr/bin/zsh $USER
