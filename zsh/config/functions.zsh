# Create a new directory and enter it.
mkcd() {
  mkdir -p "./$1" && cd "./$1"
}

# Fuzzy cd into selected directory.
fcd() {
  DIR=`find ${1:-*} -path '*/\.*' -prune -o -type d -print 2> /dev/null | fzf-tmux` \
    && cd "$DIR"
}
