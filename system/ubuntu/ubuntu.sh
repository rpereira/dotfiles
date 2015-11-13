#!/bin/bash

################################
# TESTED WITH UBUNTU 14.04 LTS #
################################

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Get information on the newest versions of packages and their dependencies.
apt-get update

# Install useful binaries
apt-get install git
apt-get install silversearcher-ag
apt-get install tree
apt-get install xclip

# Install more recent version of Vim
apt-get remove vim-tiny
apt-get install vim

# Install THE terminal multiplexer
apt-get install tmux

# Install the Z shell and oh-my-zsh framework
apt-get install zsh
chsh -s $(which zsh)
sh -c "$(curl -fsSL \
  https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

echo "\n*** Type 'exit' to continue installation!"

# Install zsh syntax highlighting (as you type)
git clone git://github.com/zsh-users/zsh-syntax-highlighting.git \
  ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting

# Create folder to hold git-completition script
mkdir -p ${GIT_COMP:=$HOME/.zsh/_git}
curl -o $GIT_COMP \
  https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.zsh

# Create a folder to hold all the solarized color schemes
mkdir -p ${SOLARIZED:=$HOME/.solarized}

# Download solarized color schemes
git clone https://github.com/Anthony25/gnome-terminal-colors-solarized \
  $SOLARIZED/gnome-terminal-colors-solarized
git clone https://github.com/seebi/dircolors-solarized \
  $SOLARIZED/dircolors-solarized
git clone https://github.com/seebi/tmux-colors-solarized \
  $SOLARIZED/tmux-colors-solarized

# Clone this repo and change to its directory
git clone https://github.com/ruiafonsopereira/dotfiles $HOME/repos/dotfiles
cd $HOME/repos/dotfiles || exit

# symlink it up!
./symlink_setup.sh

# Install vim plugin manager
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Install vim plugins
vim +PlugInstall +qall

echo "\n*** Finished setting up your system! Logout and login again."
