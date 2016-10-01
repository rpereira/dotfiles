#!/usr/bin/env bash

# Close any open System Preferences panes to prevent them from overriding
# settings we’re about to change.
osascript -e 'tell application "System Preferences" to quit'

# ==============================================
# Activity Monitor
# ==============================================
# Show the main window when launching Activity Monitor
defaults write com.apple.ActivityMonitor OpenMainWindow -bool true

# Visualize CPU usage in the Activity Monitor Dock icon
defaults write com.apple.ActivityMonitor IconType -int 5

# Show all processes in Activity Monitor
defaults write com.apple.ActivityMonitor ShowCategory -int 0

# Sort Activity Monitor results by CPU usage
defaults write com.apple.ActivityMonitor SortColumn -string "CPUUsage"
defaults write com.apple.ActivityMonitor SortDirection -int 0

# ==============================================
# App Store
# ==============================================
# Enable the automatic update check
defaults write com.apple.SoftwareUpdate AutomaticCheckEnabled -bool true

# Download newly available updates in background
defaults write com.apple.SoftwareUpdate AutomaticDownload -int 1

# Install System data files & security updates
defaults write com.apple.SoftwareUpdate CriticalUpdateInstall -int 1

# Automatically download apps purchased on other Macs
defaults write com.apple.SoftwareUpdate ConfigDataInstall -int 1

# ==============================================
# Calendar (iCal)
# ==============================================
# Days per week: 7
defaults write com.apple.iCal "n days of week" -int 7

# Start week on: Monday
defaults write com.apple.iCal "first day of week" -int 1

# Show week numbers
defaults write com.apple.iCal "Show Week Numbers" -bool true

# ==============================================
# Dashboard
# ==============================================
# Disable Dashboard
defaults write com.apple.dashboard mcx-disabled -bool true

# ==============================================
# Date & Time
# ==============================================
# Set the timezone.
# see `sudo systemsetup -listtimezones` for other values
# `sudo systemsetup -gettimezone` for current value
sudo systemsetup -settimezone "Europe/Lisbon" > /dev/null

# Clock:
#   * Show AP/PM
#   * Show the day of the week
#   * Show date
defaults write com.apple.menuextra.clock DateFormat -string 'EEE MMM d  h:mm a'

# ==============================================
# Dock
# ==============================================
# Enable highlight hover effect for the grid view of a stack (Dock)
defaults write com.apple.dock mouse-over-hilite-stack -bool true

# Set the icon size of Dock items to 50 pixels
defaults write com.apple.dock tilesize -int 50

# Change minimize/maximize window effect
defaults write com.apple.dock mineffect -string "scale"

# Minimize windows into their application’s icon
defaults write com.apple.dock minimize-to-application -bool true

# Enable spring loading for all Dock items
defaults write com.apple.dock enable-spring-load-actions-on-all-items -bool true

# Show indicator lights for open applications in the Dock
defaults write com.apple.dock show-process-indicators -bool true

# Don’t animate opening applications from the Dock. Remove that bounce while the
# app is launching.
defaults write com.apple.dock launchanim -bool false

# Automatically hide and show the Dock
defaults write com.apple.dock autohide -bool true

# Don’t show Dashboard as a Space
defaults write com.apple.dock dashboard-in-overlay -bool true

# ==============================================
# Finder
# ==============================================
# Avoid creating .DS_Store files on network volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

# Set Desktop as the default location for new Finder windows
# Show all filename extensions
defaults write com.apple.finder AppleShowAllExtensions -bool true

# For other paths, use `PfLo` and `file:///full/path/here/`
defaults write com.apple.finder NewWindowTarget -string "PfDe"
defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}/Desktop/"

# Show path bar
defaults write com.apple.finder ShowPathbar -bool true

# ==============================================
# General
# ==============================================
# Set computer name (as done via System Preferences → Sharing)
sudo scutil --set ComputerName "fringe"

# Set language and text formats
# Note: if you’re in the US, replace `EUR` with `USD`, `Centimeters` with
# `Inches`, `en_GB` with `en_US`, and `true` with `false`.
defaults write NSGlobalDomain AppleLanguages -array "en"
defaults write NSGlobalDomain AppleLocale -string "en_US@currency=EUR"
defaults write NSGlobalDomain AppleMeasurementUnits -string "Centimeters"
defaults write NSGlobalDomain AppleMetricUnits -bool true

# Menu bar extras
defaults write com.apple.systemuiserver menuExtras -array \
  "/System/Library/CoreServices/Menu Extras/Bluetooth.menu" \
  "/System/Library/CoreServices/Menu Extras/AirPort.menu" \
  "/System/Library/CoreServices/Menu Extras/Battery.menu" \
  "/System/Library/CoreServices/Menu Extras" \
  "/System/Library/CoreServices/Menu Extras/Clock.menu"

# Enable Dark mode
# FIXME THis does not seem to work on El Capitan
# defaults write /Library/Preferences/.GlobalPreferences AppleInterfaceTheme Dark

# Enable fast user switching
sudo defaults write /Library/Preferences/.GlobalPreferences MultipleSessionEnabled -bool YES

# ==============================================
# Hot corners
# ==============================================
# Possible values:
#  0: no-op
#  2: Mission Control
#  3: Show application windows
#  4: Desktop
#  5: Start screen saver
#  6: Disable screen saver
#  7: Dashboard
# 10: Put display to sleep
# 11: Launchpad
# 12: Notification Center
# Top left screen corner → Mission Control
defaults write com.apple.dock wvous-tl-corner -int 2
defaults write com.apple.dock wvous-tl-modifier -int 0
# Top right screen corner → Desktop
defaults write com.apple.dock wvous-tr-corner -int 4
defaults write com.apple.dock wvous-tr-modifier -int 0
# Bottom left screen corner → Start screen saver
defaults write com.apple.dock wvous-bl-corner -int 0
defaults write com.apple.dock wvous-bl-modifier -int 0

# ==============================================
# iTerm2
# ==============================================
# Load preferences from a custom folder
defaults write com.googlecode.iterm2 PrefsCustomFolder "$HOME/.dotfiles/iterm2"

# ==============================================
# Mail
# ==============================================
# Add the keyboard shortcut ⌘ + Enter to send an email in Mail.app
defaults write com.apple.mail NSUserKeyEquivalents -dict-add "Send" "@\U21a9"

# ==============================================
# Mouse
# ==============================================
# Enable secondary click on Apple's Magic Mouse (defaults to click on right side)
defaults write com.apple.driver.AppleBluetoothMultitouch.mouse MouseButtonMode TwoButton

# ==============================================
# Photos
# ==============================================
# Prevent Photos from opening automatically when devices are plugged in
defaults -currentHost write com.apple.ImageCapture disableHotPlug -bool true

# ==============================================
# Physical Access
# ==============================================
defaults write com.apple.screensaver askForPassword -int 1

# ==============================================
# Screen
# ==============================================
# Save screenshots to the desktop
defaults write com.apple.screencapture location -string "${HOME}/Desktop"

# Save screenshots in PNG format (other options: BMP, GIF, JPG, PDF, TIFF)
defaults write com.apple.screencapture type -string "png"

# ==============================================
# Trackpad
# ==============================================
# Enable tap to click for this user and for the login screen
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

# ==============================================
# Kill affected applications
# ==============================================
declare -a AFFECTED_APPS=("Activity Monitor" "Calendar" "Dock" "Finder" "iCal"
                          "Mail" "Photos" "SystemUIServer")
for app in "${AFFECTED_APPS[@]}"; do
  killall "${app}" &> /dev/null
done

info "Done. Note that some of these changes require a logout/restart to take effect."
