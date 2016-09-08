#!/usr/bin/env bash

# Returns true if the specified binary exists.
binary_exists() {
  command -v "$1" >/dev/null 2>&1
}

declare -a BINARIES_TO_TEST=(
  "ag"                             # The Silver Searcher
  "ctags"
  "diff-so-fancy"
  "dos2unix"
  "fzf"
  "git"
  "gpg"
  "convert"                        # ImageMagick
  "less"
  "pandoc"
  "reattach-to-user-namespace"
  "shellcheck"
  "tmux"
  "tree"
  "vim"
  "wget"
  "zsh"
)

printf  "\n** Testing binaries on your PATH\n"

for cmd in "${BINARIES_TO_TEST[@]}"; do
  if binary_exists "$cmd"; then
    printf "${GREEN}%s${NO_COLOR}\n" "[OK] $cmd"
  else
    printf "${RED}%s${NO_COLOR}\n" "[FAIL] $cmd"
  fi
done

printf  "** Done testing binaries on your PATH\n"
