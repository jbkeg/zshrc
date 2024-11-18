alias nvimlazy="NVIM_APPNAME=nvim-lazyvim nvim"
alias nvimkick="NVIM_APPNAME=nvim-kickstart nvim"
alias nvimastro="NVIM_APPNAME=nvim-astrovim nvim"

function nvims() {
	# Define the directory containing your Neovim configurations
	local config_dir="$HOME/.config"

	# List available configurations, including a "default" option
	local configs=$(fd --max-depth 1 --glob 'nvim-*' "$config_dir" | xargs -n 1 basename)
	local options=$(echo -e "default\n$configs")

	# Use fzf to select a configuration
	local config=$(echo "$options" | fzf --prompt=" Neovim Config  " --height=~50% --layout=reverse --border --exit-0)

	# Exit if nothing is selected
	[[ -z $config ]] && return

	# Determine the NVIM_APPNAME based on the selection
	if [[ $config == "default" ]]; then
		NVIM_APPNAME=""
	else
		NVIM_APPNAME=$config
	fi

	# Open Neovim with the selected configuration
	NVIM_APPNAME=$NVIM_APPNAME nvim "$@"
}

if [[ -n $SSH_CONNECTION ]]; then
	export EDITOR='vim'
else
	export EDITOR='code --wait'
fi
alias edit=nvim

alias emacs="emacs -nw"
alias doomemacs="emacs --with-profile doom -nw"
alias spaceemacs="emacs --with-profile space -nw"

function emacss() {
	# Select one of emacs profile within emacs profile directory
	profile=$(fd --max-depth 1 --glob '*' $HOME/.config/chemacs/profiles | xargs basename | fzf --prompt=" Emacs Profile  " --height=~50% --layout=reverse --border --exit-0)

	[[ -z $profile ]] && return

	emacs --with-profile $profile -nw $@
}
