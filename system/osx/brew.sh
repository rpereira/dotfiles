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

fancy_echo "Installing GNU tools..."
# Install GNU core utilities (those that come with OS X are outdated).
brew install coreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed --with-default-names
# Install `wget` with IRI support.
brew install wget --with-iri

fancy_echo "Installing Unix tools..."
brew install git
brew install diff-so-fancy
brew install fzf
brew install homebrew/dupes/screen
brew install less
brew install reattach-to-user-namespace
brew install the_silver_searcher
brew install tmux
brew install tree
brew install vim --override-system-vi
brew install --HEAD macvim-dev/macvim/macvim
brew install zsh

fancy_echo "Installing programming languages..."
brew install node
brew install rbenv
brew install ruby-build

fancy_echo "Installing other useful binaries..."
brew install imagemagick --with-webp

fancy_echo "Installing OpenPG tools..."
brew install gnupg gpg-agent pinentry-mac

# Remove outdated versions from the cellar.
brew cleanup
