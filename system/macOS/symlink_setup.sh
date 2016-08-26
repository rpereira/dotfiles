#!/usr/bin/env bash

info "Creating symlinks..."

# Symlink dotfiles to our home.
ln -sf "$HOME/code/dotfiles" "$DOTFILES_DIR"

ln -sf "$SOLARIZED_DIR/dircolors-solarized/dircolors.256dark" "$HOME/.dircolors"

# zsh
ln -sf "$DOTFILES_DIR/zsh/zshrc" "$HOME/.zshrc"
ln -sf "$DOTFILES_DIR/zsh/zshenv" "$HOME/.zshenv"
ln -sf "$DOTFILES_DIR/zsh/zprofile" "$HOME/.zprofile"

# vim
ln -sf "$DOTFILES_DIR/vim/vimrc" "$HOME/.vimrc"
ln -sf "$DOTFILES_DIR/vim/gvimrc" "$HOME/.gvimrc"
ln -sf "$DOTFILES_DIR/vim/ftplugin" "$HOME/.vim/after"
ln -sf "$DOTFILES_DIR/vim/UltiSnips" "$HOME/.vim/UltiSnips"

# tmux
ln -sf "$DOTFILES_DIR/tmux/tmux.conf" "$HOME/.tmux.conf"

# git
ln -sf "$DOTFILES_DIR/git/gitconfig" "$HOME/.gitconfig"
ln -sf "$DOTFILES_DIR/git/gitignore_global" "$HOME/.gitignore_global"

# TheSi"lverSearcher ignore list
ln -sf "$DOTFILES_DIR/ag/agignore" "$HOME/.agignore"

# ctags"
ln -sf "$DOTFILES_DIR/ctags/ctags" "$HOME/.ctags"

info "Done."
