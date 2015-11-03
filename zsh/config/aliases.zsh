# --------------------------------------------
# Navigation
# --------------------------------------------
alias l='ls'
alias ll='ls -al'
alias ln='ln -v'

# --------------------------------------------
# Sortcuts
# --------------------------------------------
alias e="$EDITOR"
alias v="$VISUAL"
alias vi=vim

# Pretty print the path
alias path='echo $PATH | tr -s ":" "\n"'

# --------------------------------------------
# Tmux
# --------------------------------------------
alias tat='create_if_needed_and_attach'

# Set correct term for tmux so solarized theme works in vim.
alias tmux="TERM=screen-256color-bce tmux"

# --------------------------------------------
# Bundler
# --------------------------------------------
alias b="bundle"

# --------------------------------------------
# Rails
# --------------------------------------------

# Basic commands
alias r='rails'
alias rn='rails new'
alias rs='rails server'
alias rg='rails generate'
alias rc='rails console'
alias rdb='rails dbconsole'
alias rd='rails destroy'

# Rake
alias rr='rake routes'
alias rm='rake db:migrate'

# Other
alias devlog='tail -f log/development.log'

# --------------------------------------------
# Vagrant
# --------------------------------------------
alias v="vagrant"
alias vs="vagrant status"
alias vh="vagrant halt"
alias vu="vagrant up"

# --------------------------------------------
# GNOME
# --------------------------------------------

# Lock screen
alias afk='gnome-screensaver-command --lock'

# Hide/show all desktop icons
alias hidedesktop='gsettings set org.gnome.desktop.background show-desktop-icons false'
alias showdesktop='gsettings set org.gnome.desktop.background show-desktop-icons true'

# --------------------------------------------
# Custom
# --------------------------------------------
[ -f ~/.aliases.local ] && source ~/.aliases.local
