# enter blinking mode - red
export LESS_TERMCAP_mb=$(printf '\e[01;31m')
#
# enter double-bright mode - bold, magenta
export LESS_TERMCAP_md=$(printf '\e[01;35m')

# turn off all appearance modes (mb, md, so, us)
export LESS_TERMCAP_me=$(printf '\e[0m')
#
# leave standout mode
export LESS_TERMCAP_se=$(printf '\e[0m')
#
# enter standout mode - yellow
export LESS_TERMCAP_so=$(printf '\e[01;33m')
#
# leave underline mode
export LESS_TERMCAP_ue=$(printf '\e[0m')
#
# enter underline mode - cyan
export LESS_TERMCAP_us=$(printf '\e[04;36m')
