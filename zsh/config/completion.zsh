# Load and initialize the completion system ignoring insecure directories.
autoload -Uz compinit && compinit -i

unsetopt FLOWCONTROL
unsetopt MENU_COMPLETE

setopt ALWAYS_TO_END
setopt AUTO_MENU
setopt COMPLETE_IN_WORD
setopt EXTENDEDGLOB

zmodload -i zsh/complist

# case-insensitive (all), partial-word and then substring completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' \
       'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# Autocompletion with an arrow-key driven interface
zstyle ':completion:*:*:*:*:*' menu select

# disable named-directories autocompletion
zstyle ':completion:*:cd:*' tag-order local-directories directory-stack path-directories

zstyle ':completion:*:paths' accept-exact '*(N)'
zstyle ':completion::complete:*' use-cache 1
zstyle ':completion::complete:*' cache-path $ZSH_CACHE_DIR

# Don't complete uninteresting users
zstyle ':completion:*:*:*:users' ignored-patterns \
  man postgres shutdown '_*'

zstyle '*' single-ignored complete
