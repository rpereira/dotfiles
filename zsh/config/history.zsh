HISTFILE=$ZSH/.zsh_history

HISTSIZE=10000
SAVEHIST=10000

# Expire duplicate entries first when trimming history.
setopt HIST_EXPIRE_DUPS_FIRST

# Delete old recorded entry if new entry is a duplicate.
setopt HIST_IGNORE_ALL_DUPS

# Remove superfluous blanks before adding to the history list.
setopt HIST_REDUCE_BLANKS

# Don't write duplicate entries in the history file.
setopt HIST_SAVE_NO_DUPS

# New history lines are added as soon as they are entered.
setopt INC_APPEND_HISTORY
