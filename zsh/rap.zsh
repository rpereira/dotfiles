# Use the 16 colors terminal option to get VIM to look like GVIM with solarized colors.
set t_Co=16

# Activate the theme for all future shell sessions.
eval `dircolors $ZSH_CUSTOM/dircolors_solarized/dircolors.ansi-light`

# Load additional files.
source $ZSH_CUSTOM/aliases.zsh

# Use vim as the visual editor
export VISUAL=vim
export EDITOR=$VISUAL

# Shiftit
export SHIFTIT="/home/rap/repos/shiftit"
