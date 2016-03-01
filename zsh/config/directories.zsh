#------------------------------------------------
# Change, make and remove directory
#------------------------------------------------
setopt AUTOCD
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
alias l='ls -lah'
alias la='ls -lAh'
alias ll='ls -lh'
alias lsa='ls -lah'

# Set Solarized dircolors
if [[ $(uname) == 'FreeBSD' || $(uname) == 'Darwin'  ]]; then
  LSCOLORS=''
  LSCOLORS+='gx' # Directory
  LSCOLORS+='fx' # Symbolic link
  LSCOLORS+='cx' # Socket
  LSCOLORS+='dx' # Pipe
  LSCOLORS+='cx' # Executable
  LSCOLORS+='eg' # Block special
  LSCOLORS+='ed' # Character special
  LSCOLORS+='ab' # Executable with setuid bit set
  LSCOLORS+='ag' # Executable with setgid bit set
  LSCOLORS+='cc' # Directory writable to others, with sticky bit
  LSCOLORS+='bd' # Directory writable to others, without sticky bit
  export LSCOLORS
else
  # TODO
  #eval `dircolors $HOME/.dircolors`
fi
