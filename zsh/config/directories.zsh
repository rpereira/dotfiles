#------------------------------------------------
# Change, make and remove directory
#------------------------------------------------
setopt AUTO_CD
setopt AUTO_PUSHD
setopt PUSHDMINUS
setopt PUSHD_IGNORE_DUPS

DIRSTACKSIZE=5

alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'
alias -g ......='../../../../..'

alias -- -='cd -'
alias 1='cd -'
alias 2='cd -2'
alias 3='cd -3'
alias 4='cd -4'
alias 5='cd -5'

alias md='mkdir -p'
alias rd='rmdir'
alias d='dirs -v'

#------------------------------------------------
# List directory
#------------------------------------------------
alias ls='ls --color --group-directories-first'
alias l='ls -lah'
alias la='ls -lAh'
alias ll='ls -lh'
alias lsa='ls -lah'

# Set Solarized Dark colors for GNU ls
eval `dircolors $HOME/.dircolors`
