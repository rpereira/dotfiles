#!/usr/bin/env bash

info() {
  local fmt="$1"; shift

  # shellcheck disable=SC2059
  printf "\n$fmt\n" "$@"
}

export DOTFILES_DIR=$HOME/.dotfiles
export SOLARIZED_DIR=$HOME/.solarized

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Install Xcode Command Line Tools
if [ -z "$(xcode-select -p)" ]; then
  xcode-select --install
fi

# Install Homebrew and Cask
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew tap caskroom/cask

# Install Casks
# shellcheck disable=SC1090
source "$DIR/casks.sh"

# Install Homebrew formulaes
# shellcheck disable=SC1090
source "$DIR/brew.sh"

# Create a folder to hold all the solarized color schemes
mkdir -p "$SOLARIZED_DIR"

# Download solarized color schemes
git clone git@github.com:tomislav/osx-terminal.app-colors-solarized.git \
  "$SOLARIZED_DIR/osx-terminal.app-colors-solarized"

git clone git@github.com:seebi/dircolors-solarized.git \
  "$SOLARIZED_DIR/dircolors-solarized"

# Symlink it up!
# shellcheck disable=SC1090
source "$DIR/symlink_setup.sh"

# Compile manpages
make -f "$DOTFILES_DIR/man/Makefile"

# Compile ZSH-related files for faster autoloading
declare -a ZFILES=('zshrc' 'zshenv' 'zprofile')
for zfile in "${ZFILES[@]}"; do
  zcompile "$HOME/.$zfile"
done
unset ZFILES

# Append /usr/local/bin/zsh to the end of /etc/shells file
grep -q -F '/usr/local/bin/zsh2' /etc/shells || sudo bash -c "echo /usr/local/bin/zsh2 >> /etc/shells"

# Make ZSH the default shell
chsh -s "$(which zsh)"

# Install vim plugin manager
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Install vim plugins
vim +PlugInstall +qall

# Set user preferences
# shellcheck disable=SC1090
source "$DIR/defaults.sh"
