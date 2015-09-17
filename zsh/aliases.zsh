# Unix
alias l='ls'
alias ll='ls -al'
alias e="$EDITOR"

# General
alias zshconfig="e ~/.zshrc"
alias myzshconfig="e $ZSH_CUSTOM/rap.zsh"

# Shiftit
alias shiftit="bundle exec foreman start -f Procfile.dev"
alias tail_log="tail -f log/development.log"

# Vagrant
alias v="vagrant"
alias vs="vagrant status"
alias vh="vagrant halt"
alias vu="vagrant up"
