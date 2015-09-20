#!/bin/bash

# Install zsh and oh-my-zsh if the first doesn't exist in the system
if ! command -v zsh >/dev/null 2>&1; then
  echo "Installing ZSH"
  sudo apt-get install zsh

  # Make ZSH the default shell
  chsh -s $(which zsh)

  # Install oh-my-zsh
  sh -c "$(curl -fsSLi https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

  # Lauch zsh
  zsh
fi

# Install tmux if it does not exist in the system
if ! command -v tmux >/dev/null 2>&1; then
  echo "Installing tmux"
  sudo apt-get install tmux
fi

# Uninstall vim.tiny if it exists on the system
if ! command -v vim-tiny >/dev/null 2>&1; then
  echo "Uninstalling vim-tiny"
  sudo apt-get remove vim-tiny
fi

# Install vim if it does not exist in the system
if ! command -v vim >/dev/null 2>&1; then
  echo "Installing vim"
  sudo apt-get install vim
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
