# Get host operating system
platform='unknown'
unamestr=$(uname)
if [[ $unamestr == 'Linux' ]]; then
  platform='linux'
elif [[ $unamestr == 'Darwin' ]]; then
  platform='darwin'
fi
# --------------------------------------------
# Sortcuts
# --------------------------------------------
alias e="$EDITOR"
alias v="$VISUAL"
alias vi=vim

# This actually happens a lot
alias :q='exit'

# Pretty print the path
alias path='echo $PATH | tr -s ":" "\n"'

# A list of directories for TheSilverSearcher ignore
alias ag='ag --path-to-agignore=~/.agignore'

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
alias rdbm='rake db:migrate'

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
# System specific
# --------------------------------------------
# OSX
if [[ $platform == 'darwin' ]]; then
  # Lock the screen
  alias afk='/System/Library/CoreServices/"Menu Extras"/User.menu/Contents/Resources/CGSession -suspend'

  # Copy the contents of the id_rsa.pub file to the clipboard.
  alias sshkey='pbcopy < ~/.ssh/id_rsa.pub | echo "=> SSH key was copied to the clipboard."'

# Linux with GNOME
elif [[ $platform == 'linux' ]]; then
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
alias ip='dig +short myip.opendns.com @resolver1.opendns.com'
alias png='ping www.google.pt'

# --------------------------------------------
# Custom
# --------------------------------------------
[ -f ~/.aliases.local ] && source ~/.aliases.local
