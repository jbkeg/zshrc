# zshrc

Jons' personal zshell configuration enhanced with [oh-my-zsh](https://ohmyz.sh/) and [powerlevel10k](https://github.com/romkatv/powerlevel10k)

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

Run install script to install `omz` and `p10k` and it's own `dotfiles`

```zsh
./install.sh
```

### Post-install

Enable or disable omz plugins and customize
Select color schemes you want to implement into Iterm2

### Uninstallation

Run uninstall script to uninstall `omz` and `p10k` and restore with backup `dotfiles`

```zsh
./uninstall.sh
rm -rf /path/to/zshrc/repo
```
