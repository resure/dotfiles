#!/usr/bin/env bash
set -euo pipefail

DOTFILES="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

link() {
  local src="$DOTFILES/$1" dst="$2"
  if [[ "$(readlink -f "$dst" 2>/dev/null)" == "$(readlink -f "$src")" ]]; then
    echo "ok       $dst"
  elif [[ -e "$dst" || -L "$dst" ]]; then
    echo "SKIPPED  $dst exists and is not managed by dotfiles" >&2
  else
    mkdir -p "$(dirname "$dst")"
    ln -s "$src" "$dst"
    echo "linked   $dst"
  fi
}

link gitconfig "$HOME/.gitconfig"
link gitignore_global "$HOME/.gitignore_global"
link aliases "$HOME/.aliases"
link functions "$HOME/.functions"
link nvim "$HOME/.config/nvim"
# herdr keeps sockets, logs and session state next to its config, so only the file is linked
link herdr/config.toml "$HOME/.config/herdr/config.toml"

if [[ "$(uname -s)" == "Darwin" ]]; then
  link lazygit "$HOME/Library/Application Support/lazygit"
  link zshrc "$HOME/.zshrc"
  link kitty "$HOME/.config/kitty"
  link osx/Library/KeyBindings/DefaultKeyBinding.dict "$HOME/Library/KeyBindings/DefaultKeyBinding.dict"
else
  link lazygit "$HOME/.config/lazygit"
fi

"$DOTFILES/install-cli-tools.sh"

nvim --headless "+Lazy! restore" +qa
