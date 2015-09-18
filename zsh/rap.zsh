# Set correct term for tmux so solarized theme works in vim.
alias tmux="TERM=screen-256color-bce tmux"

# Activate the theme for all future shell sessions.
eval `dircolors $ZSH_CUSTOM/dircolors_solarized/dircolors.ansi-light`

# Load additional files.
source $ZSH_CUSTOM/aliases.zsh

# Use vim as the visual editor
export VISUAL=vim
export EDITOR=$VISUAL

# Shiftit
export SHIFTIT="/home/rap/repos/shiftit"
