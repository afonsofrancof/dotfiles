#!/bin/bash

echo "Configuring macOS system defaults..."

# NSGlobalDomain settings
defaults write -g AppleShowAllExtensions -bool true
defaults write -g ApplePressAndHoldEnabled -bool false
defaults write -g KeyRepeat -int 2
defaults write -g InitialKeyRepeat -int 15
defaults write -g com.apple.mouse.tapBehavior -int 1
defaults write -g com.apple.sound.beep.volume -float 0.0
defaults write -g com.apple.sound.beep.feedback -int 0

# Dock settings
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock autohide-delay -float 0.1
defaults write com.apple.dock autohide-time-modifier -float 0.0
defaults write com.apple.dock show-recents -bool false
defaults write com.apple.dock launchanim -bool false
defaults write com.apple.dock orientation -string "bottom"
defaults write com.apple.dock tilesize -int 48
defaults write com.apple.dock mineffect -string "scale"

# Finder settings
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

# Trackpad settings
defaults write com.apple.AppleMultitouchTrackpad Clicking -bool true
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerDrag -bool true
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerDrag -bool true

echo "Restarting affected services..."
killall Dock
killall Finder

echo "Configuration complete! Some changes may require a logout/login to take effect."