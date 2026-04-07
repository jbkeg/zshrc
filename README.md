# zshrc

Jons' personal zshell configuration enhanced with [oh-my-zsh](https://ohmyz.sh/) and [powerlevel10k](https://github.com/romkatv/powerlevel10k)

> Deprecated: this repository now acts as a compatibility entrypoint into [`dotfiles`](/Users/suptest/.dotfiles/dotfiles). Use the `zsh-macos` profile there for ongoing setup and changes.

## Table of contents

- [zshrc](#zshrc)
	- [Table of contents](#table-of-contents)
	- [Installation](#installation)
		- [Pre-Install](#pre-install)
		- [Install](#install)
		- [Post-install](#post-install)
		- [Uninstallation](#uninstallation)

## Installation

### Pre-Install

Requirement

- git
- [iTerm2](https://iterm2.com/)

### Install

Run the compatibility wrapper to forward into the consolidated repo:

```zsh
./install.zsh
```

Equivalent command in the consolidated repo:

```sh
../dotfiles/bootstrap/install --profile zsh-macos --links
```

### Post-install

Enable or disable omz plugins and customize
Select color schemes you want to implement into Iterm2

### Uninstallation

Run the compatibility wrapper to unlink the consolidated profile:

```zsh
./uninstall.zsh
```
