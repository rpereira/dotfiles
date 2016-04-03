#!/bin/bash

################################
# TESTED WITH UBUNTU 14.04 LTS #
################################

echo "\n*** Creating symlinks..."

SOLARIZED=$HOME/.solarized
DOTFILES=$HOME/.dotfiles

# Symlink dotfiles to our home.
ln -sf $HOME/repos/dotfiles $DOTFILES/.dotfiles

# zsh
ln -sf $DOTFILES/zsh/zshrc $HOME/.zshrc
ln -sf $DOTFILES/zsh/zshenv $HOME/.zshenv
ln -sf $DOTFILES/zsh/zprofile $HOME/.zprofile

# vim
ln -sf $DOTFILES/vim/vimrc $HOME/.vimrc
ln -sf $DOTFILES/vim/ftplugin $HOME/.vim/ftplugin

# tmux
ln -sf $DOTFILES/tmux/tmux.conf $HOME/.tmux.conf

# git
ln -sf $DOTFILES/git/gitconfig $HOME/.gitconfig

# Gnome Colors Solarized
cd $SOLARIZED/gnome-terminal-colors-solarized || exit
./set_dark.sh

# dircolors Solarized
ln -sf $SOLARIZED/dircolors-solarized/dircolors.ansi-dark $HOME/.dircolors

# git diff-highlight
# See https://github.com/git/git/tree/master/contrib/diff-highlight
sudo ln -sf /usr/share/doc/git/contrib/diff-highlight/diff-highlight /bin/
sudo chmod +x /bin/diff-highlight

# TheSilverSearcher ignore list
ln -sf $DOTFILES/ag/agignore $HOME/.agignore
