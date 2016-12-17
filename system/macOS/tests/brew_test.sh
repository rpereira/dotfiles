#!/usr/bin/env bash

# Returns true if the specified binary exists.
binary_exists() {
  command -v "$1" >/dev/null 2>&1
}

# Just care about the core binaries
declare -a BINARIES_TO_TEST=(
  "ag"
  "curl"
  "ctags"
  "diff-so-fancy"
  "dos2unix"
  "fzf"
  "git"
  "gpg"
  "less"
  "pandoc"
  "openssl"
  "reattach-to-user-namespace"
  "shellcheck"
  "tmux"
  "tree"
  "vim"
  "wget"
  "zsh"
)

print_title "Testing binaries in your PATH"

for cmd in "${BINARIES_TO_TEST[@]}"; do
  increment_tests_runned
  if binary_exists "$cmd"; then
    print_success
  else
    push_error "$cmd does not exist in your PATH"
    print_error
  fi
done
printf "\n"
