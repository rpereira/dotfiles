#!/usr/bin/env zsh
#
# Rui Afonso Pereira prompt based on the Solarized Dark theme.
# Use 14pt Monaco for Powerline with 1.1 vertical space.
#
# # README
#
# This theme needs the zsh/config/git.zsh file in order to work as expected.
#
# # Goals
#
# The aim of this theme is to only show you *relevant* information. For
# instance, it will only show git information when in a git working directory;
# gives feedback on whether the last call exited with an error.
#

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[green]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"

ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[red]%}✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=" %{$fg[green]%}✔%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_ADDED="%{$fg[green]%}✚ "
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg[yellow]%}⚑ "
ZSH_THEME_GIT_PROMPT_DELETED="%{$fg[red]%}✖ "
ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg[blue]%}▴ "
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[cyan]%}§ "
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[grey]%}◒ "

# Set the prompt's char color to red when the command line return an error;
# default is white.
local prompt_char="%(?:%{$fg_bold[white]%}$ :%{$fg_bold[red]%}$ %s)"

# Display the whole current directory path.
local current_dir="%{$fg[blue]%}%~%{$reset_color%} %s"

# Determine the time elapsed since last commit.
function _git_time_since_commit() {
  # Only proceed if there is actually a commit.
  if git log -1 > /dev/null 2>&1; then
    # Get the last commit.
    last_commit=$(git log --pretty=format:'%at' -1 2> /dev/null)
    now=$(date +%s)
    seconds_since_last_commit=$((now-last_commit))

    # Totals
    minutes=$((seconds_since_last_commit / 60))
    hours=$((seconds_since_last_commit / 3600))

    # Sub-hours and sub-minutes
    days=$((seconds_since_last_commit / 86400))
    sub_hours=$((hours % 24))
    sub_minutes=$((minutes % 60))

    if [ $hours -gt 24 ]; then
      commit_age="${days}d"
    elif [ $minutes -gt 60 ]; then
      commit_age="${sub_hours}h${sub_minutes}m"
    else
      commit_age="${minutes}m"
    fi

    echo "%{$reset_color%}$commit_age"
  fi
}

setopt PROMPT_SUBST

PROMPT='
${current_dir} $(git_prompt_info)
${prompt_char}%{$reset_color%}'

RPROMPT='%{$(echotc UP 1)%}$(_git_time_since_commit) $(git_prompt_status)%{$(echotc DO 1)%}%{$reset_color%}'
