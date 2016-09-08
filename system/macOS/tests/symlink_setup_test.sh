#!/usr/bin/env bash

# Returns true if the specified file exists and is a symbolic link.
symlink_exists() {
  [[ -L $1 ]]
}

ATOM_DIR="$HOME/.atom"
VIM_DIR="$HOME/.vim"

declare -a SYMLINKS_TO_TEST=(
  "$HOME/.dotfiles"

  "$ATOM_DIR/config.cson"
  "$ATOM_DIR/init.coffee"
  "$ATOM_DIR/keymap.cson"
  "$ATOM_DIR/snippets.cson"
  "$ATOM_DIR/styles.less"

  "$HOME/.vimrc"
  "$HOME/.gvimrc"
  "$VIM_DIR/after/ftplugin"
  "$VIM_DIR/UltiSnips"

  "$HOME/.zshrc"
  "$HOME/.zshenv"
  "$HOME/.zprofile"

  "$HOME/.tmux.conf"

  "$HOME/.gitconfig"
  "$HOME/.gitignore_global"

  "$HOME/.agignore"

  "$HOME/.ctags"

  "$HOME/.dircolors"
)

printf  "\n** Testing symbolic links\n"

for file in "${SYMLINKS_TO_TEST[@]}"; do
  if symlink_exists "$file"; then
    printf "${GREEN}%s${NO_COLOR}\n" "[OK] $file exists and is a symbolic link"
  else
    printf "${RED}%s${NO_COLOR}\n" "[FAIL] $file does not exist"
  fi
done

printf  "** Done testing symbolic links\n"
