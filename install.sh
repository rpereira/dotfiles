#!/bin/bash

fi


# Install vim Vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# Install vim plugins
vim +PluginInstall +qall

# Create a folder to hold all the solarized color schemes
cd && mkdir .solarized && cd $_
export SOLARIZED=~/.solarized

# Download solarized color schemes
git clone https://github.com/Anthony25/gnome-terminal-colors-solarized
git clone git@github.com:seebi/tmux-colors-solarized.git

# Instalation steps
source .bin/steps/color_scheme.sh
