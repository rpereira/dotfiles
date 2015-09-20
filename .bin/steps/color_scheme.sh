#!/bin/bash

handle_selection() {
  echo "$1"
}

option=$(whiptail \
  --nocancel \
  --title "Color scheme" \
  --menu \
  "Choose your prefered color scheme, which will be automaticaly applied to your ZSH, vim, and tmux.\n\nHint: you can easily switch beetween themes any time you want." \
  16 60 4 \
  '1' 'Solarized Light (default)' \
  '2' 'Solarized Dark' \
  '3' 'Neither: I want to use another color scheme' \
  3>&1 1>&2 2>&3)

exit_status=$?

if [ $exit_status = 0 ]; then
  handle_selection "$option"
fi
