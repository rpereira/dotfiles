#!/bin/bash

SOLARIZED=~/.solarized

# Create a folder to hold all the solarized color schemes
if [ ! -d $SOLARIZED ]; then
  cd && mkdir .solarized
fi

cd $SOLARIZED || exit

# Download solarized color schemes
if [ ! -d gnome-terminal-colors-solarized ]; then
  git clone https://github.com/Anthony25/gnome-terminal-colors-solarized
fi

if [ ! -d dircolors-solarized ]; then
  git clone https://github.com/seebi/dircolors-solarized
fi

if [ ! -d tmux-colors-solarized ]; then
  git clone https://github.com/seebi/tmux-colors-solarized
fi

cd || exit

# Install vim plugins
vim +PlugInstall +qall

# Install Gnome Colors Solarized
$SOLARIZED/gnome-terminal-colors-solarized/install.sh

# Install dir colors solarized
if [ ! -f $ZSH_CUSTOM/.dircolors.ansi-light ]; then
  ln -s $SOLARIZED/dircolors-solarized/dircolors.ansi-light $ZSH_CUSTOM/.dircolors.ansi-light
fi

# Configure Neovim.
# See: https://github.com/neovim/neovim/wiki/Following-HEAD#20151026
echo "Do you have Neovim installed in your system?"
select yn in "Yes" "No"; do
  case $yn in
    Yes ) configure_nvim; break;;
    No ) exit;;
  esac
done

echo "Finished setting up your system."

function configure_nvim {
  cd ~/.config/nvim || exit
  ln -s ~/.vim/autoload ~/.config/nvim/autoload
  ln -s ~/.vim/bundle ~/.config/bundle
  ln -s ~/repos/dotfiles/vimrc ~/.config/nvim/init.vim
}
