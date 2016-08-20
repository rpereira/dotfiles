#!/usr/bin/env bash
#
# Install macOS applications using Homebrew Cask.

info "Installing Dropbox"
brew cask install dropbox

info "Installing Atom"
brew cask install atom

info "Installing Evernote"
brew cask install evernote

info "Installing Firefox"
brew cask install firefox

info "Installing Google Chrome"
brew cask install google-chrome

info "Installing Haskell Platform"
brew cask install haskell-platform

info "Installing iTerm2"
brew cask install iterm2

info "Installing Postgres.app"
brew cask install postgres

info "Installing Slack"
brew cask install slack

info "Installing SourceTree"
brew cask install sourcetree

# Apps not on Cask but I want regardless:
# * Markoff
