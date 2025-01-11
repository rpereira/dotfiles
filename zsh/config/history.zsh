HISTFILE=$ZDOTDIR/.zsh_history

HISTSIZE=10000
SAVEHIST=10000

# Save beginning and ending timestamps to the history file.
setopt EXTENDED_HISTORY

# Expire duplicate entries first when trimming history.
setopt HIST_EXPIRE_DUPS_FIRST

# Delete old recorded entry if new entry is a duplicate.
setopt HIST_IGNORE_ALL_DUPS

# Do not enter command lines into the history list if they are duplicates of the
# previous event.
setopt HIST_IGNORE_DUPS

# Remove superfluous blanks before adding to the history list.
setopt HIST_REDUCE_BLANKS

# Don't write duplicate entries in the history file.
setopt HIST_SAVE_NO_DUPS

# Do not execute immediately upon history expansion.
setopt HIST_VERIFY

# New history lines are added as soon as they are entered.
setopt INC_APPEND_HISTORY

# Share history between all sessions.
setopt SHARE_HISTORY
