#!/usr/bin/env bash

# Returns true if the specified file exists and is a symbolic link.
symlink_exists() {
  [[ -L $1 ]]
}

NVIM_CONFIG="${XDG_CONFIG_HOME:-$HOME/.config}/nvim"

declare -a SYMLINKS_TO_TEST=(
  "$HOME/.dotfiles"

  "$HOME/.agignore"

  "$HOME/.ctags"

  "$HOME/.curlrc"

  "$HOME/.dircolors"

  "$HOME/.gitconfig"
  "$HOME/.gitignore_global"

  "$HOME/.tmux.conf"

  "$NVIM_CONFIG/init.vim"
  "$NVIM_CONFIG/after/ftplugin"
  "$NVIM_CONFIG/UltiSnips"

  "$HOME/.zlogin"
  "$HOME/.zshrc"
  "$HOME/.zshenv"
  "$HOME/.zprofile"
)

print_title "Testing symbolic links"

for file in "${SYMLINKS_TO_TEST[@]}"; do
  increment_tests_runned
  if symlink_exists "$file"; then
    print_success
  else
    push_error "$file does not exist"
    print_error
  fi
done
printf "\n"
