#!/bin/zsh

reset_launchpad() {
    echo "Resetting Launchpad..."
    defaults write com.apple.dock ResetLaunchPad -bool true; killall Dock
}
