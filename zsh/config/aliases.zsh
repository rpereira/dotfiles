# --------------------------------------------
# Shortcuts
# --------------------------------------------
alias e="$EDITOR"
alias v="$VISUAL"
alias vi="$VISUAL"
alias vim="$VISUAL"

# This actually happens a lot
alias :q='exit'

# Pretty print the path
alias path='echo $PATH | tr -s ":" "\n"'

## Summary for args to less:
# less(1)
#   -M (-M or --LONG-PROMPT) Prompt very verbosely
#   -I (-I or --IGNORE-CASE) Searches with '/' ignore case
#   -R (-R or --RAW-CONTROL-CHARS) For handling ANSI colors
#   -F (-F or --quit-if-one-screen) Auto exit if <1 screen
#   -X (-X or --no-init) Disable termcap init & deinit
alias ag='ag --pager="less -MIRFX"'

alias afk='mac lock'
alias ip='mac ip'
alias ping!='mac check-internet'

# Copy the contents of the id_rsa.pub file to the clipboard.
alias sshkey='pbcopy < ~/.ssh/id_rsa.pub | echo "=> SSH key was copied to the clipboard."'

# Open current directory in finder.
alias f='open -a Finder ./'

# --------------------------------------------
# Network
# --------------------------------------------
alias hosts='sudo $EDITOR /etc/hosts'

# --------------------------------------------
# Just for fun
# --------------------------------------------
alias weather='curl wttr.in/Porto'
alias moon='curl wttr.in/Moon'
