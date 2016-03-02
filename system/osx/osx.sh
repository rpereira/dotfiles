#!/usr/bin/env bash

# Create folder to hold git-completition script
mkdir -p ${GIT_COMP:=$HOME/.zsh/_git}
curl -o $GIT_COMP \
  https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.zsh

# Create a folder to hold all the solarized color schemes
mkdir -p ${SOLARIZED:=$HOME/.solarized}

# Download solarized color schemes
git clone git@github.com:tomislav/osx-terminal.app-colors-solarized.git \
  $SOLARIZED/osx-terminal.app-colors-solarized

# Install brew formulaes
./system/osx/brew.sh

# symlink it up!
#./system/osx/symlink_setup.sh

# Install vim plugin manager
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Install vim plugins
vim +PlugInstall +qall

# Set user preferences
./system/osx/defaults.sh
