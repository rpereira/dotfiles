# Outputs current branch info in prompt format
function git_prompt_info() {
  local ref
  ref=$(command git symbolic-ref HEAD 2> /dev/null) || \
  ref=$(command git rev-parse --short HEAD 2> /dev/null) || return 0
  echo "$ZSH_THEME_GIT_PROMPT_PREFIX${ref#refs/heads/}$(parse_git_dirty)$ZSH_THEME_GIT_PROMPT_SUFFIX"
}

# Checks if the current branch is dirty.
function parse_git_dirty() {
  local STATUS=$(command git status --porcelain 2> /dev/null | tail -n1)
  if [[ -n $STATUS ]]; then
    echo "$ZSH_THEME_GIT_PROMPT_DIRTY"
  else
    echo "$ZSH_THEME_GIT_PROMPT_CLEAN"
  fi
}

# Gets the difference between the local and remote branches
function git_remote_status() {
    local remote ahead behind git_remote_status git_remote_status_detailed
    remote=${$(command git rev-parse --verify ${hook_com[branch]}@{upstream} --symbolic-full-name 2>/dev/null)/refs\/remotes\/}
    if [[ -n ${remote} ]]; then
        ahead=$(command git rev-list ${hook_com[branch]}@{upstream}..HEAD 2>/dev/null | wc -l)
        behind=$(command git rev-list HEAD..${hook_com[branch]}@{upstream} 2>/dev/null | wc -l)

        if [[ $ahead -eq 0 ]] && [[ $behind -eq 0 ]]; then
            git_remote_status="$ZSH_THEME_GIT_PROMPT_EQUAL_REMOTE"
        elif [[ $ahead -gt 0 ]] && [[ $behind -eq 0 ]]; then
            git_remote_status="$ZSH_THEME_GIT_PROMPT_AHEAD_REMOTE"
            git_remote_status_detailed="$ZSH_THEME_GIT_PROMPT_AHEAD_REMOTE_COLOR$ZSH_THEME_GIT_PROMPT_AHEAD_REMOTE$((ahead))%{$reset_color%}"
        elif [[ $behind -gt 0 ]] && [[ $ahead -eq 0 ]]; then
            git_remote_status="$ZSH_THEME_GIT_PROMPT_BEHIND_REMOTE"
            git_remote_status_detailed="$ZSH_THEME_GIT_PROMPT_BEHIND_REMOTE_COLOR$ZSH_THEME_GIT_PROMPT_BEHIND_REMOTE$((behind))%{$reset_color%}"
        elif [[ $ahead -gt 0 ]] && [[ $behind -gt 0 ]]; then
            git_remote_status="$ZSH_THEME_GIT_PROMPT_DIVERGED_REMOTE"
            git_remote_status_detailed="$ZSH_THEME_GIT_PROMPT_AHEAD_REMOTE_COLOR$ZSH_THEME_GIT_PROMPT_AHEAD_REMOTE$((ahead))%{$reset_color%}$ZSH_THEME_GIT_PROMPT_BEHIND_REMOTE_COLOR$ZSH_THEME_GIT_PROMPT_BEHIND_REMOTE$((behind))%{$reset_color%}"
        fi

        if [[ -n $ZSH_THEME_GIT_PROMPT_REMOTE_STATUS_DETAILED ]]; then
            git_remote_status="$ZSH_THEME_GIT_PROMPT_REMOTE_STATUS_PREFIX$remote$git_remote_status_detailed$ZSH_THEME_GIT_PROMPT_REMOTE_STATUS_SUFFIX"
        fi

        echo $git_remote_status
    fi
}

# Outputs the name of the current branch
# Usage example: git pull origin $(git_current_branch)
# Using '--quiet' with 'symbolic-ref' will not cause a fatal error (128) if
# it's not a symbolic ref, but in a Git repo.
function git_current_branch() {
  local ref
  ref=$(command git symbolic-ref --quiet HEAD 2> /dev/null)
  local ret=$?
  if [[ $ret != 0 ]]; then
    [[ $ret == 128 ]] && return  # no git repo.
    ref=$(command git rev-parse --short HEAD 2> /dev/null) || return
  fi
  echo ${ref#refs/heads/}
}


# Gets the number of commits ahead from remote
function git_commits_ahead() {
  if $(echo "$(command git log @{upstream}..HEAD 2> /dev/null)" | grep '^commit' &> /dev/null); then
    local COMMITS
    COMMITS=$(command git log @{upstream}..HEAD | grep '^commit' | wc -l | tr -d ' ')
    echo "$ZSH_THEME_GIT_COMMITS_AHEAD_PREFIX$COMMITS$ZSH_THEME_GIT_COMMITS_AHEAD_SUFFIX"
  fi
}

# Outputs if current branch is ahead of remote
function git_prompt_ahead() {
  if [[ -n "$(command git rev-list origin/$(git_current_branch)..HEAD 2> /dev/null)" ]]; then
    echo "$ZSH_THEME_GIT_PROMPT_AHEAD"
  fi
}

# Outputs if current branch is behind remote
function git_prompt_behind() {
  if [[ -n "$(command git rev-list HEAD..origin/$(git_current_branch) 2> /dev/null)" ]]; then
    echo "$ZSH_THEME_GIT_PROMPT_BEHIND"
  fi
}

# Outputs if current branch exists on remote or not
function git_prompt_remote() {
  if [[ -n "$(command git show-ref origin/$(git_current_branch) 2> /dev/null)" ]]; then
    echo "$ZSH_THEME_GIT_PROMPT_REMOTE_EXISTS"
  else
    echo "$ZSH_THEME_GIT_PROMPT_REMOTE_MISSING"
  fi
}

# Get the status of the working tree
function git_prompt_status() {
  local INDEX STATUS
  INDEX=$(command git status --porcelain -b 2> /dev/null)
  STATUS=""
  if $(echo "$INDEX" | command grep -E '^\?\? ' &> /dev/null); then
    STATUS="$ZSH_THEME_GIT_PROMPT_UNTRACKED$STATUS"
  fi
  if $(echo "$INDEX" | grep '^A  ' &> /dev/null); then
    STATUS="$ZSH_THEME_GIT_PROMPT_ADDED$STATUS"
  elif $(echo "$INDEX" | grep '^M  ' &> /dev/null); then
    STATUS="$ZSH_THEME_GIT_PROMPT_ADDED$STATUS"
  fi
  if $(echo "$INDEX" | grep '^ M ' &> /dev/null); then
    STATUS="$ZSH_THEME_GIT_PROMPT_MODIFIED$STATUS"
  elif $(echo "$INDEX" | grep '^AM ' &> /dev/null); then
    STATUS="$ZSH_THEME_GIT_PROMPT_MODIFIED$STATUS"
  elif $(echo "$INDEX" | grep '^ T ' &> /dev/null); then
    STATUS="$ZSH_THEME_GIT_PROMPT_MODIFIED$STATUS"
  fi
  if $(echo "$INDEX" | grep '^R  ' &> /dev/null); then
    STATUS="$ZSH_THEME_GIT_PROMPT_RENAMED$STATUS"
  fi
  if $(echo "$INDEX" | grep '^ D ' &> /dev/null); then
    STATUS="$ZSH_THEME_GIT_PROMPT_DELETED$STATUS"
  elif $(echo "$INDEX" | grep '^D  ' &> /dev/null); then
    STATUS="$ZSH_THEME_GIT_PROMPT_DELETED$STATUS"
  elif $(echo "$INDEX" | grep '^AD ' &> /dev/null); then
    STATUS="$ZSH_THEME_GIT_PROMPT_DELETED$STATUS"
  fi
  if $(command git rev-parse --verify refs/stash >/dev/null 2>&1); then
    STATUS="$ZSH_THEME_GIT_PROMPT_STASHED$STATUS"
  fi
  if $(echo "$INDEX" | grep '^UU ' &> /dev/null); then
    STATUS="$ZSH_THEME_GIT_PROMPT_UNMERGED$STATUS"
  fi
  if $(echo "$INDEX" | grep '^## .*ahead' &> /dev/null); then
    STATUS="$ZSH_THEME_GIT_PROMPT_AHEAD$STATUS"
  fi
  if $(echo "$INDEX" | grep '^## .*behind' &> /dev/null); then
    STATUS="$ZSH_THEME_GIT_PROMPT_BEHIND$STATUS"
  fi
  if $(echo "$INDEX" | grep '^## .*diverged' &> /dev/null); then
    STATUS="$ZSH_THEME_GIT_PROMPT_DIVERGED$STATUS"
  fi
  echo $STATUS
}
