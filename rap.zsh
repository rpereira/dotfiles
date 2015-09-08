# Activate the theme for all future shell sessions.
eval `dircolors $ZSH_CUSTOM/dircolors_solarized/dircolors.ansi-light`

# Use the 16 colors terminal option to get VIM to look like GVIM with solarized colors.
set t_Co=16

alias zshconfig="atom ~/.zshrc"

# Shiftit
export SHIFTIT="/home/rap/repos/shiftit"

alias shiftit="cd $SHIFTIT && bundle exec foreman start -f Procfile.dev"
alias log="tail -f log/development.log"
