# Activate the theme for all future shell sessions.
# For now, lets just use a hack in order to get this working: all repos related
# to solarized should sit under ~/.solarized. For some reason, if we specify the
# path of the expression to eval to
# ~/solarized/dircolors-solarized/dircolors.ansi-light, this expression returns
# an error saying that there is no such file on the specified path. Thus, lets
# just create a symbolic link from
# ~/solarized/dircolors-solarized/dircolors.ansi-light to
# ~/repos/dotfiles/zsh/dircolors.ansi-light.
eval `dircolors $ZSH_CUSTOM/.dircolors.ansi-light`

# Local dotfiles
LOCAL_DOTFILES=~/.dotfiles.local

# Load aliases.
[[ -f ~/.aliases ]] && source $ZSH_CUSTOM/aliases.zsh

# Awesome cd movements from zshkit.
setopt autocd autopushd pushdminus pushdsilent pushdtohome cdablevars
DIRSTACKSIZE=5

# Local config
[[ -f $LOCAL_DOTFILES/zshrc.local ]] && source ~/$LOCAL_DOTFILES/zshrc.local
