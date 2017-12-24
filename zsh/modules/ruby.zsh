# Return if ruby and rbenv are not found.
if ! command -v ruby >/dev/null; then
  echo "Error loading $0: Module requires 'ruby' to be installed."
  return 1
fi

if ! command -v rbenv >/dev/null; then
  echo "Error loading $0: Module requires 'rbenv' to be installed."
  return 1
fi

#
# Aliases
#

# Bundler
alias b='bundle'
alias be='bundle exec'
