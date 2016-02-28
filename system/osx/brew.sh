#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

fancy_echo() {
  local fmt="$1"; shift

  # shellcheck disable=SC2059
  printf "\n$fmt\n" "$@"
}

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade --all

fancy_echo "Updating Unix tools..."
brew install git
brew install homebrew/dupes/screen
brew install the_silver_searcher
brew install tmux
brew install vim --override-system-vi
brew install zsh

fancy_echo "Updating programming languages..."
brew install node
brew install rbenv

# Remove outdated versions from the cellar.
brew cleanup
