# Set correct term for tmux so solarized theme works in vim.
alias tmux="TERM=screen-256color-bce tmux"

# Unix
alias l='ls'
alias ll='ls -al'
alias ln='ln -v'
alias e="$EDITOR"
alias v="$VISUAL"
alias vi=vim

# Pretty print the path
alias path='echo $PATH | tr -s ":" "\n"'

# Tmux
alias tat='create_if_needed_and_attach'

# General
alias zshconfig="e ~/.zshrc"

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

# Include custom aliases
[ -f ~/.aliases.local ] && source ~/.aliases.local
