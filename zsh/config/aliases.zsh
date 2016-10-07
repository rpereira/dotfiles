# --------------------------------------------
# Shortcuts
# --------------------------------------------
alias e="$EDITOR"
alias v="$VISUAL"
alias vi="$VISUAL"
alias vim="$VISUAL"

alias gpg="gpg2"

# This actually happens a lot
alias :q='exit'

# Pretty print the path
alias path='echo $PATH | tr -s ":" "\n"'

# A list of directories for TheSilverSearcher ignore
alias ag='ag --path-to-ignore=~/.agignore'

# --------------------------------------------
# System specific
# --------------------------------------------
# macOS
if [[ "$OSTYPE" == (darwin)* ]]; then
  alias afk='mac lock'
  alias ip='mac ip'
  alias ping!='mac check-internet'

  # Copy the contents of the id_rsa.pub file to the clipboard.
  alias sshkey='pbcopy < ~/.ssh/id_rsa.pub | echo "=> SSH key was copied to the clipboard."'

  # Open current directory in finder.
  alias f='open -a Finder ./'

# Linux
elif [[ "$OSTYPE" == (linux)* ]]; then
  # Lock the screen
  alias afk='gnome-screensaver-command --lock'

  # Hide/show all desktop icons
  alias hidedesktop='gsettings set org.gnome.desktop.background show-desktop-icons false'
  alias showdesktop='gsettings set org.gnome.desktop.background show-desktop-icons true'
fi

# --------------------------------------------
# Network
# --------------------------------------------
alias hosts='sudo $EDITOR /etc/hosts'

# --------------------------------------------
# Just for fun
# --------------------------------------------
alias weather='curl wttr.in/Porto'
alias moon='curl wttr.in/Moon'

# --------------------------------------------
# Custom
# --------------------------------------------
[ -f ~/.aliases.local ] && source ~/.aliases.local
