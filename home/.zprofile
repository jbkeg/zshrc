eval "$(/opt/homebrew/bin/brew shellenv)"

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"

# Load .bash_login to complete
[[ -f $HOME/.zwelcome ]] && source $HOME/.zwelcome
