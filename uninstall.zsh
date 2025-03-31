#!/usr/bin/env zsh

# -e: Exit on error
# -u: Exit on unset variables
set -eu

log_color() {
	color_code="$1"
	shift
	printf "\033[${color_code}m%s\033[0m\n" "$*" >&2
}

log_red() { log_color "0;31" "$@"; }
log_blue() { log_color "0;34" "$@"; }
log_task() { log_blue "🔃" "$@"; }
log_error() { log_red "❌" "$@"; }

error() {
	log_error "$@"
	exit 1
}

# Set the directory of the script
script_dir="$(cd -P -- "$(dirname -- "$(command -v -- "$0")")" && pwd -P)"

# Backup directory
backup_dir="$script_dir/backup"

# Uninstall oh-my-zsh and custom setup
omz_dir="$HOME/.oh-my-zsh"
if [ -d "$omz_dir" ]; then
	log_task "Removing oh-my-zsh..."
	rm -rf "$omz_dir"
fi

# Restore dotfiles
log_task "Restoring dotfiles..."
for dotfile in $script_dir/home/.*; do
	target_file=$(basename -- "$dotfile")

	log_task "Restoring $HOME/$target_file from $backup_dir/home/$target_file.bak"
	if [ -f "$backup_dir/home/$target_file.bak" ]; then
		rm -f "$HOME/$target_file"
		mv "$backup_dir/home/$target_file.bak" "$HOME/$target_file"
	fi
done

# Clean up backup directory
log_task "Cleaning up backup directory..."
find "$backup_dir" ! -name ".gitkeep" -delete

log_task "Uninstallation complete!"
