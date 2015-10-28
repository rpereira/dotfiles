#!/bin/bash

SOLARIZED=~/.solarized

# Create a folder to hold all the solarized color schemes
if [ ! -d $SOLARIZED ]; then
  cd && mkdir .solarized
fi

cd $SOLARIZED || exit

# Download solarized color schemes
if [ ! -d gnome-terminal-colors-solarized ]; then
  git clone https://github.com/Anthony25/gnome-terminal-colors-solarized
fi

if [ ! -d dircolors-solarized ]; then
  git clone https://github.com/seebi/dircolors-solarized
fi

if [ ! -d tmux-colors-solarized ]; then
  git clone https://github.com/seebi/tmux-colors-solarized
fi

cd || exit

# Install vim plugins
vim +PlugInstall +qall

# Install Gnome Colors Solarized
$SOLARIZED/gnome-terminal-colors-solarized/install.sh

# Install dir colors solarized
if [ ! -f $ZSH_CUSTOM/.dircolors.ansi-light ]; then
  ln -s $SOLARIZED/dircolors-solarized/dircolors.ansi-light $ZSH_CUSTOM/.dircolors.ansi-light
fi
