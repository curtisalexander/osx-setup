#!/usr/bin/env bash

#################
# computer name #
#################

# $SYSTEM_LABEL and $SYSTEM_NAME set in settings.sh
echo "Setting system label, hostname, and local hostname"
sudo scutil --set ComputerName $SYSTEM_LABEL
sudo scutil --set HostName $SYSTEM_NAME
sudo scutil --set LocalHostName $SYSTEM_NAME
sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string $SYSTEM_NAME

#################
# host defaults #
#################

# inspired by
#   - https://gist.github.com/brandonb927/3195465
#   - https://github.com/bkuhlmann/osx/blob/master/scripts/defaults.sh

echo "System - Disable boot sound effects"
sudo nvram SystemAudioVolume=" "

echo "System - Reveal IP address, hostname, OS version, etc. when clicking the login window clock"
sudo defaults write /Library/Preferences/com.apple.loginwindow AdminHostInfo HostName

echo "System - Disable automatic termination of inactive apps"
defaults write NSGlobalDomain NSDisableAutomaticTermination -bool true

echo "System - Expand save panel by default"
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true

echo "System - Disable the 'Are you sure you want to open this application?' dialog"
defaults write com.apple.LaunchServices LSQuarantine -bool false

echo "System - Increase window resize speed for Cocoa applications"
defaults write NSGlobalDomain NSWindowResizeTime -float 0.001

echo "System - Disable window resume system-wide"
defaults write NSGlobalDomain NSQuitAlwaysKeepsWindows -bool false

echo "System - Disable auto-correct"
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

echo "System - Disable smart quotes (not useful when writing code)"
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false

echo "System - Disable smart dashes (not useful when writing code)"
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false

echo "System - Require password immediately after sleep or screen saver begins"
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0

echo "System - Avoid creating .DS_Store files on network volumes"
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

echo "Keyboard - Automatically illuminate built-in MacBook keyboard in low light"
defaults write com.apple.BezelServices kDim -bool true

echo "Keyboard - Turn off keyboard illumination when computer is not used for 5 minutes"
defaults write com.apple.BezelServices kDimTime -int 300

echo "Keyboard - Enable keyboard access for all controls"
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

echo "Keyboard - Set a fast keyboard repeat rate"
defaults write NSGlobalDomain KeyRepeat -int 0

echo "Bluetooth - Increase sound quality for headphones/headsets"
defaults write com.apple.BluetoothAudioAgent "Apple Bitpool Min (editable)" -int 40

echo "Finder - Show the $HOME/Library folder"
chflags nohidden $HOME/Library

# echo "Finder - Show hidden files"
# defaults write com.apple.finder AppleShowAllFiles -bool true

echo "Finder - Show filename extensions"
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

echo "Finder - Disable the warning when changing a file extension"
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

echo "Finder - Show path bar"
defaults write com.apple.finder ShowPathbar -bool true

echo "Finder - Show status bar"
defaults write com.apple.finder ShowStatusBar -bool true

echo "Finder - Display full POSIX path as window title"
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

echo "Finder - Use list view in all Finder windows"
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

echo "Finder - Allow quitting via COMMAND+Q -- Doing so will also hide desktop icons"
defaults write com.apple.finder QuitMenuItem -bool true

echo "Finder - Allow text selection in Quick Look"
defaults write com.apple.finder QLEnableTextSelection -bool true
	
echo "Safari - Set home page to 'about:blank' for faster loading"
defaults write com.apple.Safari HomePage -string "about:blank"
	
echo "Safari - Hide bookmarks bar"
defaults write com.apple.Safari ShowFavoritesBar -bool false

echo "Safari - Use Contains instead of Starts With in search banners"
defaults write com.apple.Safari FindOnPageMatchesWordStartsOnly -bool false
	
echo "Safari - Enable debug menu"
defaults write com.apple.Safari IncludeInternalDebugMenu -bool true

echo "Safari - Enable the Develop menu and the Web Inspector"
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true

echo "Safari - Do not send search queries to Apple"
defaults write com.apple.Safari UniversalSearchEnabled -bool false
defaults write com.apple.Safari SuppressSearchSuggestions -bool true

# https://support.rstudio.com/hc/en-us/articles/204896737
echo "Apple Press and Hold"
defaults delete -g ApplePressAndHoldEnabled
defaults write -app RStudio ApplePressAndHoldEnabled -bool false
