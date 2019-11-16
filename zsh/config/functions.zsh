# Create a new directory and enter it.
mkcd() {
  mkdir -p "./$1" && cd "./$1"
}

# Fuzzy cd into selected directory.
fd() {
  local dir
  dir=$(find ${1:-.} -path '*/\.*' -prune \
                  -o -type d -print 2> /dev/null | fzf --height=50% --border) &&
  cd "$dir"
}

docker_clean() {
  docker rm -vf $(docker ps -a -q)
  docker rmi -f $(docker images -a -q)
}
