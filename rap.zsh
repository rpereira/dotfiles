eval `dircolors $ZSH_CUSTOM/dircolors_solarized/dircolors.ansi-light`

alias zshconfig="atom ~/.zshrc"

# Shiftit
export SHIFTIT="/home/rap/repos/shiftit"

alias shiftit="cd $SHIFTIT && bundle exec foreman start -f Procfile.dev"
alias log="tail -f log/development.log"
