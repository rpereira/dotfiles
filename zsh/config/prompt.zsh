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
local prompt_char=$(echo "\u2794 ")
local return_status="%(?:%{$fg_bold[white]%}$prompt_char:%{$fg_bold[red]%}$prompt_char%s)"

# Display the whole current directory path.
local current_dir="%{$fg[blue]%}%~%{$reset_color%} %s"

setopt PROMPT_SUBST

PROMPT='
${current_dir} $(git_prompt_info)  $(vi_mode_prompt_info)
${return_status}%{$reset_color%}'

RPROMPT='%{$(echotc UP 1)%} $(git_time_since_last_commit) $(git_prompt_status)%{$(echotc DO 1)%}%{$reset_color%}'
