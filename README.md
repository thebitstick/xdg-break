# xdg-break
Script that sends a notification to remind you to take a break

## Usage
```bash
Usage:
xdg-break [OPTION...]

Help Options:
	-h, --help	Show help options
	-V, --version	Print version information and exit
	-q, --quit	Quit any running instances of xdg-break

Interval for each notification is stored in $XDG_CONFIG_HOME/xdg-break/interval
```

## Installation
### AUR
`$ yay -S xdg-break` for [xdg-break](https://aur.archlinux.org/packages/xdg-break)

OR

`$ yay -S xdg-break-git` for [xdg-break-git](https://aur.archlinux.org/packages/xdg-break-git/)
### PKGBUILD
`$ makepkg -sic`
### Other
It's just a shell script. Put it in your $PATH and you're good.
