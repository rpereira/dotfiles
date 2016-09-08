#!/usr/bin/env bash

info() {
  local fmt="$1"; shift

  # shellcheck disable=SC2059
  printf "\n$fmt\n" "$@"
}

# Temporary env vars used for installation
export DOTFILES_DIR=$HOME/.dotfiles
export SOLARIZED_DIR=$HOME/.solarized

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Install Xcode Command Line Tools
if [[ -z `xcode-select -p` ]]; then
  xcode-select --install
fi

# Install custom font
open ../../fonts/Monaco_for_Powerline.ttf

# Install Homebrew and Cask
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew tap caskroom/cask

# Install Homebrew formulaes and casks. If '--no-casks' argument is specified,
# then only brews will be installed.
case $1 in
  --no-casks)
    # shellcheck disable=SC1090
    source "$DIR/brew.sh"
    ;;

  *)
    # shellcheck disable=SC1090
    source "$DIR/brew.sh"
    # shellcheck disable=SC1090
    source "$DIR/casks.sh"
    ;;
esac

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
source '../../bin/zsh-compile'

# Append /usr/local/bin/zsh to the end of /etc/shells file
grep -q -F '/usr/local/bin/zsh' /etc/shells || sudo bash -c "echo /usr/local/bin/zsh >> /etc/shells"

# Make ZSH the default shell
chsh -s "$(which zsh)"

# Install vim plugin manager
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Install vim plugins
vim +PlugInstall +qall

# Install atom plugins
declare -a ATOM_PLUGINS=(
  file-icons
  highlight-selected
  language-elixir
  linter
  linter-elixirc
  linter-eslint
  motepair
  react
)
for plugin in "${ATOM_PLUGINS[@]}"; do
  apm install "$plugin"
done

# Set user preferences
# shellcheck disable=SC1090
source "$DIR/defaults.sh"
