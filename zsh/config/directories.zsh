#------------------------------------------------
# Change, make and remove directory
#------------------------------------------------
# Auto changes to a directory without typing cd.
setopt AUTO_CD

# Push the old directory onto the stack on cd.
setopt AUTO_PUSHD

# Swap the meaning of cd +1 and cd -1; we want them to mean the opposite of
# what they mean in csh, because it makes more sense in this scheme, and it's
# easier to type.
setopt PUSHDMINUS

# Do not store duplicates in the stack.
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

#------------------------------------------------
# Colors
#------------------------------------------------
# Set colors for GNU ls
eval `dircolors $DOTFILES/dircolors/dircolors.ansi-dark`

# Take advantage of $LS_COLORS for completion as well.
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
