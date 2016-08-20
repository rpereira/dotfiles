#!/usr/bin/env bash

fancy_echo() {
  local fmt="$1"; shift

  # shellcheck disable=SC2059
  printf "\n$fmt\n" "$@"
}

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Install Homebrew and cask
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew tap caskroom/cask

# Install Casks
./system/macOS/casks.sh

# Install Homebrew formulaes
./system/macOS/brew.sh

# Create a folder to hold all the solarized color schemes
mkdir -p ${SOLARIZED:=$HOME/.solarized}

# Download solarized color schemes
git clone git@github.com:tomislav/osx-terminal.app-colors-solarized.git \
  $SOLARIZED/osx-terminal.app-colors-solarized

git clone git@github.com:seebi/dircolors-solarized.git \
  $SOLARIZED/dircolors-solarized

# symlink it up!
./system/macOS/symlink_setup.sh

# Compile manpages
make -f $HOME/.dotfiles/man/Makefile

# Compile ZSH-related files for faster autoloading
zcompile $HOME/.zshrc
zcompile $HOME/.zshenv
zcompile $HOME/.zprofile

# Make ZSH the default shell
chsh -s $(which zsh)

# Install vim plugin manager
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Install vim plugins
vim +PlugInstall +qall

# Set user preferences
./system/macOS/defaults.sh
