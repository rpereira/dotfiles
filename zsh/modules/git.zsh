#
# Aliases
#
alias g='git'

# Add (a)
alias ga='git add'
alias gaa='git add --all'
alias gap='git add --patch'

# Branch (b)
alias gb='git branch'
alias gba='git branch -a'
alias gbda='git branch --merged | command grep -vE "^(\*|\s*main\s*$)" | command xargs -n 1 git branch -d'
alias gbnm='git branch --no-merged'
alias gbr='git branch --remote'

alias gbl='git blame -b -w'

# Bisect (bs)
alias gbs='git bisect'
alias gbsb='git bisect bad'
alias gbsg='git bisect good'
alias gbsr='git bisect reset'
alias gbss='git bisect start'

# Commit (c)
alias gc='git commit -v'
alias gc!='git commit -v --amend'
alias gca='git commit -v -a'
alias gca!='git commit -v -a --amend'
alias gcan!='git commit -v -a --no-edit --amend'
alias gcn!='git commit -v --no-edit --amend'
alias gcam='git commit -a -m'
alias gcmsg='git commit -m'

# Checkout
alias gco='git checkout'
alias gcop='git checkout -'
alias gfco='git fuzzy-checkout'
alias gcb='git checkout -b'
alias gcd='git checkout develop'
alias gcm='git checkout main'

alias gcf='git config --list'
alias gcl='git clone --recursive'
alias gcp='git cherry-pick'

# Clean up repo
alias gclean='git clean -fd'
alias gpristine='git reset --hard && git clean -dfx'

# Contributors
alias grank='git shortlog -sn --no-merges'
compdef grank=git

alias gd='git diff'
alias gdca='git diff --cached'
alias gdct='git describe --tags `git rev-list --tags --max-count=1`'
alias gdt='git diff-tree --no-commit-id --name-only -r'
gdv() { git diff -w "$@" | view - }
compdef _git gdv=git-diff
alias gdw='git diff --word-diff'

# Fetch (f)
alias gf='git fetch'
alias gfa='git fetch --all'

alias gg='git gui citool'
alias gga='git gui citool --amend'

ggf() {
  [[ "$#" != 1 ]] && local b="$(git_current_branch)"
  git push --force origin "${b:=$1}"
}
compdef _git ggf=git-checkout

ggl() {
  if [[ "$#" != 0 ]] && [[ "$#" != 1 ]]; then
    git pull origin "${*}"
  else
    [[ "$#" == 0 ]] && local b="$(git_current_branch)"
    git pull origin "${b:=$1}"
  fi
}
compdef _git ggl=git-checkout

ggp() {
  if [[ "$#" != 0 ]] && [[ "$#" != 1 ]]; then
    git push origin "${*}"
  else
    [[ "$#" == 0 ]] && local b="$(git_current_branch)"
    git push origin "${b:=$1}"
  fi
}
compdef _git ggp=git-checkout

ggpnp() {
  if [[ "$#" == 0 ]]; then
    ggl && ggp
  else
    ggl "${*}" && ggp "${*}"
  fi
}
compdef _git ggpnp=git-checkout

ggu() {
  [[ "$#" != 1 ]] && local b="$(git_current_branch)"
  git pull --rebase origin "${b:=$1}"
}
compdef _git ggu=git-checkout

alias ggpur='ggu'
compdef _git ggpur=git-checkout

alias ggpull='git pull origin $(git_current_branch)'
compdef _git ggpull=git-checkout

alias ggpush='git push origin $(git_current_branch)'
compdef _git ggpush=git-checkout

alias ggsup='git branch --set-upstream-to=origin/$(git_current_branch)'
alias gpsup='git push --set-upstream origin $(git_current_branch)'

alias gignore='git update-index --assume-unchanged'
alias gignored='git ls-files -v | grep "^[[:lower:]]"'

# gitk
alias gk='\gitk --all --branches'
compdef _git gk='gitk'
alias gke='\gitk --all $(git log -g --pretty=format:%h)'
compdef _git gke='gitk'

# Log (lg)
alias glg='git log --stat --color'
alias glgp='git log --stat --color -p'
alias glo='git log --oneline --decorate --color'
alias glol="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias glola="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --all"
alias glog='git log --oneline --decorate --color --graph'

alias gm='git merge'
alias gmom='git merge origin/main'
alias gmum='git merge upstream/main'

alias gmt='git mergetool --no-prompt'
alias gmtvim='git mergetool --no-prompt --tool=vimdiff'

alias gp='git push'
alias gpd='git push --dry-run'
alias gpoat='git push origin --all && git push origin --tags'
compdef _git gpoat=git-push
alias gpu='git push upstream'
alias gpv='git push -v'

# Remote (r)
alias gr='git remote'
alias grv='git remote -v'
alias gra='git remote add'
alias grup='git remote update'
alias grmv='git remote rename'
alias grrm='git remote remove'
alias grset='git remote set-url'

# Rebase (rb)
alias grb='git rebase'
alias grba='git rebase --abort'
alias grbc='git rebase --continue'
alias grbs='git rebase --skip'
alias grbi='git rebase -i'
alias grbfcs='git rebase -i `git-commit-sha`'
alias grbm='git rebase main'
alias grbd='git rebase develop'

# Reset
alias grh='git reset HEAD'
alias grhh='git reset HEAD --hard'
alias gru='git reset --'

# Status
alias gst='git status'
alias gss='git status -s'
alias gsb='git status -sb'

alias gsi='git submodule init'
alias gsu='git submodule update'
alias gsps='git show --pretty=short --show-signature'

# Stash
alias gsta='git stash'
alias gstaa='git stash apply'
alias gstd='git stash drop'
alias gstl='git stash list'
alias gstp='git stash pop'
alias gsts='git stash show --text'

alias gts='git tag -s'
alias gtv='git tag | sort -V'

# Pull
alias gl='git pull'
alias gup='git pull --rebase'
alias gupv='git pull --rebase -v'
alias glum='git pull upstream main'

# Helpers
alias grt='cd $(git rev-parse --show-toplevel || echo ".")'

alias gunignore='git update-index --no-assume-unchanged'
alias gwip='git add -A; git commit -n -m "--wip-- [skip ci]"'
alias gunwip='git log -n 1 | grep -q -c "\-\-wip\-\-" && git reset HEAD~1'

alias gwch='git whatchanged -p --abbrev-commit --pretty=medium'
