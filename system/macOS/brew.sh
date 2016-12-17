#!/usr/bin/env bash
#
# Install command-line tools using Homebrew.

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade --all

info "Installing GNU tools..."
# Install GNU core utilities (those that come with macOS are outdated).
brew install coreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed --with-default-names
# Install `wget` with IRI support.
brew install wget --with-iri

info "Installing Unix tools..."
brew install git
brew install ctags
brew install diff-so-fancy
brew install fzf
brew install homebrew/dupes/screen
brew install homebrew/dupes/less
brew install reattach-to-user-namespace
brew install the_silver_searcher
brew install tmux
brew install tree
brew install vim --HEAD --without-nls --with-override-system-vi
brew install zsh
brew install zsh-completions
brew install zsh-history-substring-search
brew install zsh-syntax-highlighting

info "Installing programming languages..."
brew install elixir
brew install nodenv
brew install rbenv
brew install ruby-build
brew install rust

info "Installing other useful binaries..."
brew install dos2unix
brew install imagemagick --with-webp
brew install pandoc
brew install shellcheck

info "Installing not so useful binaries..."
brew install cowsay
brew install fortune

info "Installing OpenPG tools..."
brew install gnupg2 gpg-agent pinentry-mac

# Remove outdated versions from the cellar.
brew cleanup
