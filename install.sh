#!/bin/bash

# Install Oh My Zsh
if ! command -v curl >/dev/null 2>&1; then
  sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
elif ! command -v wget >/dev/null 2>&1; then
  sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
fi

export SOLARIZED=~/.solarized

# Create a folder to hold all the solarized color schemes
if [ ! -d $SOLARIZED ]; then
  cd && mkdir .solarized
fi

cd $SOLARIZED || exit

# Download solarized color schemes
git clone https://github.com/Anthony25/gnome-terminal-colors-solarized
git clone https://github.com/seebi/dircolors-solarized
git clone https://github.com/seebi/tmux-colors-solarized

# Install vim Vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# Install vim plugins
vim +PluginInstall +qall

# Instalation steps
#source .bin/steps/color_scheme.sh

# Install Gnome Colors Solarized
~/.solarized/gnome-terminal-colors-solarized/install.sh

# Install dir colors solarized
ln -s ~/.solarized/dircolors-solarized/dircolors.ansi-light .dircolors.ansi-light
