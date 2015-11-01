#!/bin/bash

################################
# TESTED WITH UBUNTU 14.04 LTS #
################################

SOLARIZED=$HOME/.solarized
DOTFILES=$HOME/repos/dotfiles

# zsh
ln -sf $DOTFILES/zsh/zshrc $HOME/.zshrc
ln -sf $DOTFILES/zsh/zshenv $HOME/.zshenv

# vim
ln -sf $DOTFILES/vim/vimrc $HOME/.vimrc

# tmux
ln -sf $DOTFILES/tmux/tmux.conf $HOME/.tmux.conf

# git
ln -sf $DOTFILES/git/gitconfig $HOME/.gitconfig

# Gnome Colors Solarized Light
cd $SOLARIZED/gnome-terminal-colors-solarized || exit
./set_light.sh

# dircolors Solarized Light
ln -sf $SOLARIZED/dircolors-solarized/dircolors.ansi-light $HOME/.dircolors

# git diff-highlight
# See https://github.com/git/git/tree/master/contrib/diff-highlight
sudo ln -sf /usr/share/doc/git/contrib/diff-highlight/diff-highlight /bin/
sudo chmod +x /bin/diff-highlight
