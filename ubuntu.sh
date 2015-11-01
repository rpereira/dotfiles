#!/bin/bash

################################
# TESTED WITH UBUNTU 14.04 LTS #
################################

sudo apt-get update
sudo apt-get install git

sudo apt-get remove vim-tiny
sudo apt-get install vim

sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt-get update
sudo apt-get install neovim

sudo apt-get install tmux

sudo apt-get install zsh
chsh -s $(which zsh)
sh -c "$(curl -fsSL \
  https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
git clone git://github.com/zsh-users/zsh-syntax-highlighting.git \
  ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting

sudo apt-get install ack-grep

# Create a folder to hold all the solarized color schemes
mkdir -p ${SOLARIZED:=$HOME/.solarized}

# Download solarized color schemes
git clone https://github.com/Anthony25/gnome-terminal-colors-solarized $SOLARIZED
git clone https://github.com/seebi/dircolors-solarized $SOLARIZED
git clone https://github.com/seebi/tmux-colors-solarized $SOLARIZED

# symlink it up!
./symlink_setup.sh

# Install vim plugins
vim +PlugInstall +qall
