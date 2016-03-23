#!/usr/bin/env bash

local DOTFILES=$HOME/.dotfiles

# Symlink dotfiles to our home.
ln -sf $HOME/code/dotfiles $DOTFILES/.dotfiles

ln -sf $HOME/.solarized/dircolors-solarized/dircolors.256dark $HOME/.dircolors

# zsh
ln -sf $DOTFILES/zsh/zshrc $HOME/.zshrc
ln -sf $DOTFILES/zsh/zshenv $HOME/.zshenv

# vim
ln -sf $DOTFILES/vim/vimrc $HOME/.vimrc
ln -sf $DOTFILES/vim/ftplugin $HOME/.vim/ftplugin
ln -sf $DOTFILES/vim/UltiSnips ~/.vim

# tmux
ln -sf $DOTFILES/tmux/tmux.conf $HOME/.tmux.conf

# git
ln -sf $DOTFILES/git/gitconfig $HOME/.gitconfig

# TheSilverSearcher ignore list
ln -sf $DOTFILES/ag/agignore $HOME/.agignore
