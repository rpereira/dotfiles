# enter blinking mode
export LESS_TERMCAP_mb=$(printf "\e[1;31m")

# enter double-bright mode
export LESS_TERMCAP_md=$(printf "\e[1;31m")

# turn off all appearance modes (mb, md, so, us)
export LESS_TERMCAP_me=$(printf "\e[0m")

# leave standout mode
export LESS_TERMCAP_se=$(printf "\e[0m")

# enter standout mode - yellow
export LESS_TERMCAP_so=$(printf "\e[0;37;102m")

# leave underline mode
export LESS_TERMCAP_ue=$(printf "\e[0m")

# enter underline mode
export LESS_TERMCAP_us=$(printf "\e[4;32m")
