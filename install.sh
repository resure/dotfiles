#!/usr/bin/env bash
set -euo pipefail

DOTFILES="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
export PATH="$HOME/.local/bin:$PATH"

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

# Linux keeps the stock ~/.bashrc, so a two-line block sourcing the linked fragment is
# appended to it once. The block is fixed, so nothing in ~/.bashrc is ever rewritten;
# the wiring itself lives in the fragment and can change without touching it.
wire_bashrc() {
  local rc="$HOME/.bashrc" marker="# >>> dotfiles >>>"
  if grep -qF "$marker" "$rc" 2>/dev/null; then
    echo "ok       $rc"
    return
  fi
  cat >>"$rc" <<'EOF'

# >>> dotfiles >>>
# Managed by ~/code/dotfiles/install.sh
[ -f "$HOME/.bashrc.dotfiles" ] && . "$HOME/.bashrc.dotfiles"
# <<< dotfiles <<<
EOF
  echo "wired    $rc"
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
  link bashrc "$HOME/.bashrc.dotfiles"
  wire_bashrc
fi

"$DOTFILES/install-cli-tools.sh"

nvim --headless "+Lazy! restore" +qa
nvim --headless "+lua require('config.bootstrap').run()" +qa
