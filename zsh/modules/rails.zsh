# Return if bundle command is not found.
if ! command -v bundle >/dev/null; then
  echo "Error loading $0: Module requires 'bundle' to be installed."
  return 1
fi

#
# Aliases
#

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
