# Sourced from the block install.sh appends to the stock ~/.bashrc; linked as
# ~/.bashrc.dotfiles. See zshrc for the macOS equivalent — there the whole file is linked.
#
# Omarchy and plain Arch both ship a ~/.bashrc with the aliases and functions of the
# distro, so this only adds what no distro provides: ~/.local/bin on PATH for the tools
# install-cli-tools.sh drops there, and the shared aliases, functions and machine-local
# settings from ~/.localrc (tokens, work aliases, version managers).
#
# Sourced last, so anything here overrides the distro defaults.

case ":$PATH:" in
  *":$HOME/.local/bin:"*) ;;
  *) PATH="$HOME/.local/bin:$PATH" ;;
esac
export PATH

[ -f "$HOME/.aliases" ] && . "$HOME/.aliases"
[ -f "$HOME/.functions" ] && . "$HOME/.functions"
[ -f "$HOME/.localrc" ] && . "$HOME/.localrc"
