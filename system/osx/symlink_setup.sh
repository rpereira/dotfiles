#!/usr/bin/env bash

DOTFILES=$HOME/.dotfiles

# Symlink dotfiles to our home.
ln -sf $HOME/code/dotfiles $DOTFILES/.dotfiles

# zsh
ln -sf $DOTFILES/zsh/zshrc $HOME/.zshrc
ln -sf $DOTFILES/zsh/zshenv $HOME/.zshenv

# vim
ln -sf $DOTFILES/vim/vimrc $HOME/.vimrc
ln -sf $DOTFILES/vim/ftplugin $HOME/.vim/ftplugin

# tmux
ln -sf $DOTFILES/tmux/tmux.conf $HOME/.tmux.conf

# git
ln -sf $DOTFILES/git/gitconfig $HOME/.gitconfig

# git diff-highlight
# See https://github.com/git/git/tree/master/contrib/diff-highlight
sudo ln -sf /usr/local/share/git-core/contrib/diff-highlight/diff-highlight \
  /usr/local/bin

# TheSilverSearcher ignore list
ln -sf $DOTFILES/ag/agignore $HOME/.agignore
