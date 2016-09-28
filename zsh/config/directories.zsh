#------------------------------------------------
# Change, make and remove directory
#------------------------------------------------
setopt AUTO_CD
setopt AUTO_PUSHD
setopt PUSHDMINUS
setopt PUSHD_IGNORE_DUPS


alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'
alias -g ......='../../../../..'

# Prevent the directory stack from getting too large.
DIRSTACKSIZE=9

for index ({1..$DIRSTACKSIZE}); do
  alias "$index"="cd -${index}"
done
unset index

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
