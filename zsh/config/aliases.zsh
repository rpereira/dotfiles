# Set correct term for tmux so solarized theme works in vim.
alias tmux="TERM=screen-256color-bce tmux"

# Unix
alias l='ls'
alias ll='ls -al'
alias e="$EDITOR"
alias vi=nvim
alias vim=nvim
LSB_DISTRIBUTOR='lsb_release -i -s'

# Ubuntu specific aliases
# autocomplete-able apt-xxx aliases
if [[ "$LSB_DISTRIBUTOR" == "Ubuntu" ]]; then
  alias acs='apt-cache show'
  alias agi='sudo apt-get install'
  alias ag='sudo apt-get'
  alias agu='sudo apt-get update'
  alias agug='sudo apt-get upgrade'
  alias aguu='agu && agug'
  alias agr='sudo apt-get uninstall'
  alias agp='sudo apt-get purge'
  alias aga='sudo apt-get autoremove'
fi

# General
alias zshconfig="e ~/.zshrc"
alias myzshconfig="e $ZSH_CUSTOM/rap.zsh"

# Bundler
alias b="bundle"

# Shiftit
alias start="bundle exec foreman start -f Procfile.dev"
alias migrate="foreman run rake db:migrate"
alias tail_log="tail -f log/development.log"

# Vagrant
alias v="vagrant"
alias vs="vagrant status"
alias vh="vagrant halt"
alias vu="vagrant up"
