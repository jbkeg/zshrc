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

# Ensure backup directory exists
backup_dir="$script_dir/backup"

# Install omz if not already installed
omz_dir="$HOME/.oh-my-zsh"
if ! command -v omz &>/dev/null && [ ! -d $omz_dir ]; then
	log_task "Installing oh-my-zsh..."

	if ! command -v git &>/dev/null; then
		error "Git command not found. Please install Git first."
	fi
	git clone https://github.com/ohmyzsh/ohmyzsh.git $omz_dir

	log_task "Installing omz custom..."
	if [ -d "$omz_dir/custom" ]; then
		mv $omz_dir/custom $script_dir/backup/custom.bak
	fi
	ln -sf $script_dir/omz/custom $omz_dir

	omz_custom="$omz_dir/custom"

	log_task "Installing external plugins..."
	if ! [ -d $omz_custom/plugins ]; then
		mkdir -p $HOME/.oh-my-zsh/custom/plugins
	fi
	omz_plugins="$omz_custom/plugins"

	log_task "Installing autoupdate.."
	git clone https://github.com/TamCore/autoupdate-oh-my-zsh-plugins $omz_plugins/autoupdate

	log_task "Installing fast syntax highlight..."
	git clone https://github.com/zdharma-continuum/fast-syntax-highlighting.git $omz_plugins/fast-syntax-highlighting

	log_task "Installing zsh autosuggestions..."
	git clone https://github.com/zsh-users/zsh-autosuggestions $omz_plugins/zsh-autosuggestions

	log_task "Installing zsh syntax highlighting..."
	git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $omz_plugins/zsh-syntax-highlighting

	log_task "Installing powerlevel10k..."
	if ! [ -d $omz_custom/themes ]; then
		mkdir -p $HOME/.oh-my-zsh/custom/themes
	fi
	omz_themes=$omz_custom/themes
	git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $omz_themes/powerlevel10k
fi

# Installing dotfiles
log_task "Install dotfiles..."
for dotfile in $script_dir/home/.*; do
	target_file=$(basename -- "$dotfile")

	log_task "Backing up $HOME/$target_file to $backup_dir/home/$target_file.bak"
	if ! [ -f $backup_dir/home ]; then
		mkdir -p "$backup_dir/home"
	fi
	if [ -f "$HOME/$target_file" ]; then
		mv "$HOME/$target_file" "$backup_dir/home/$target_file.bak"
	fi

	ln -sf "$dotfile" "$HOME/$target_file"
done
