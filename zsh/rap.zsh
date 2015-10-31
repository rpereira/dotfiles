eval `dircolors $HOME/.dircolors`

# Load aliases.
[[ -f $ZSH_CUSTOM/aliases.zsh ]] && source $ZSH_CUSTOM/aliases.zsh

# Awesome cd movements from zshkit.
setopt autocd autopushd pushdminus pushdsilent pushdtohome cdablevars
DIRSTACKSIZE=5

# This repo path. In the future, perhaps this should be asked during
# installation. For now, lets just assume that the repo is cloned to
# ~/repos/dotfiles.
export DOTFILES=~/repos/dotfiles

# If local dotfiles exists, load the local zsh config.
if [ -d ~/.dotfiles.local ]; then
  export LOCAL_DOTFILES=~/.dotfiles.local
  [[ -f $LOCAL_DOTFILES/zshrc.local ]] && source $LOCAL_DOTFILES/zshrc.local
fi
