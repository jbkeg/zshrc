#!/bin/zsh

global_update() {
    # Colors for output using tput
    bold=$(tput bold)
    green=$(tput setaf 2)
    red=$(tput setaf 1)
    reset=$(tput sgr0)

    # Function to print a formatted message
    print_message() {
        local color="$1"
        local message="$2"
        echo "${bold}${color}${message}${reset}"
    }

    # Function to print a separator line
    print_separator() {
        echo "----------------------------------------"
    }

    # Function to update Homebrew
    update_homebrew() {
        print_message "$green" "Updating Homebrew..."
        brew update
        print_message "$green" "Upgrading installed formula and cask..."
        brew upgrade --greedy
        print_message "$green" "Cleaning up Homebrew..."
        brew cleanup -s --prune=all
        print_message "$green" "Removing outdated packages..."
        brew autoremove
        print_separator
    }

    # Function to update Oh My Zsh
    update_omz() {
        print_message "$green" "Updating Oh My Zsh..."
        upgrade_oh_my_zsh_all
        print_separator
    }

    # Function to update mise
	update_mise() {
		print_message "$green" "Updating Mise..."
		mise upgrade
		print_separator
	}

    # Function to update gcloud CLI
    update_gcloud() {
        print_message "$green" "Updating gcloud CLI..."
        gcloud components update --quiet
        print_separator
    }

    # Function to update Rust-up
    update_rust() {
        print_message "$green" "Updating Rust-up..."
        rustup self update
        rustup update
        print_separator
    }

    # Function to update apps from the Mac App Store
    update_app_store() {
        print_message "$green" "Updating app store apps"
        mas upgrade
        print_separator
    }

    # Function to organize the launchpad
    organize_launchpad() {
        print_message "$green" "Organizing Launchpad..."
        defaults write com.apple.dock ResetLaunchPad -bool true; killall Dock
        print_separator
    }

    # Run all updates
    update_homebrew
    update_omz    # For Oh My Zsh update
	update_mise
    update_gcloud
    update_rust
    update_app_store
    organize_launchpad
    print_message "$green" "Global update completed."
}

