#!/usr/bin/env bash

# ==============================================
# Interface
# ==============================================
# Hide bluetooth icon from the menu bar.
gsettings set com.canonical.indicator.bluetooth visible false

# Use custom date format in the menu bar.
gsettings set com.canonical.indicator.datetime time-format "custom"
gsettings set com.canonical.indicator.datetime custom-time-format "%a %b %e, %l:%M %p"

# Show login name in the menu bar.
gsettings set com.canonical.indicator.session show-real-name-on-panel true

# ==============================================
# Privacy
# ==============================================
# Turn off "Remote Search" so that search terms in Dash do not get sent over
# the internet.
gsettings set com.canonical.Unity.Lenses remote-content-search 'none'

# Disable Dash "More suggestions" section.
gsettings set com.canonical.Unity.ApplicationsLens display-available-apps false

# ==============================================
# Terminal
# ==============================================
# Set default font for Terminal app
gconftool-2 --set /apps/gnome-terminal/profiles/Default/font --type string \
  "Monaco for Powerline 13"
