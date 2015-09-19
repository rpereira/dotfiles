# Activate the theme for all future shell sessions.
eval `dircolors $ZSH_CUSTOM/dircolors_solarized/dircolors.ansi-light`

# Load aliases.
[[ -f ~/.aliases  ]] && source $ZSH_CUSTOM/aliases.zsh

# Use vim as the visual editor
export VISUAL=vim
export EDITOR=$VISUAL

# Shiftit
export SHIFTIT="/home/rap/repos/shiftit"

# Awesome cd movements from zshkit.
setopt autocd autopushd pushdminus pushdsilent pushdtohome cdablevars
DIRSTACKSIZE=5
