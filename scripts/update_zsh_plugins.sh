#!/usr/bin/env bash
#
# Updates all the declared zsh plugins declared as git submodules.

base_path=zsh/modules
modules=(
  pure
  z
  zsh-completions
  zsh-history-substring-search
  zsh-syntax-highlighting
)

for plugin in "${modules[@]}"; do
  printf "Updating %s... " "$plugin"
  git submodule update --init --remote -- "$base_path/$plugin" > /dev/null
  printf "Done!\n"
done
