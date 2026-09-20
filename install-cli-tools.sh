#!/usr/bin/env bash
set -euo pipefail

DOTFILES="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

if [[ "$(uname -s)" == "Darwin" ]]; then
  brew bundle --no-upgrade --file="$DOTFILES/Brewfile"
  exit 0
fi

if [[ "$(uname -sm)" != "Linux x86_64" ]]; then
  echo "unsupported platform: $(uname -sm)" >&2
  exit 1
fi

NVIM_VERSION=0.12.5
LAZYGIT_VERSION=0.65.1
DELTA_VERSION=0.19.2
TUICR_VERSION=0.26.0
RIPGREP_VERSION=15.2.0
FD_VERSION=10.5.0
FZF_VERSION=0.74.4
TREE_SITTER_VERSION=0.27.0

BIN_DIR="$HOME/.local/bin"
OPT_DIR="$HOME/.local/opt"
TMP_DIR="$(mktemp -d)"
trap 'rm -rf "$TMP_DIR"' EXIT

mkdir -p "$BIN_DIR" "$OPT_DIR"

has_version() {
  local name="$1" version="$2"
  [[ -x "$BIN_DIR/$name" ]] && "$BIN_DIR/$name" --version 2>/dev/null | grep -qF "$version"
}

install_binary() {
  local name="$1" version="$2" url="$3"
  if has_version "$name" "$version"; then
    echo "$name $version already installed"
    return
  fi
  local unpacked="$TMP_DIR/$name"
  mkdir -p "$unpacked"
  echo "installing $name $version"
  curl -fsSL "$url" | tar -xz -C "$unpacked"
  install -m 755 "$(find "$unpacked" -type f -name "$name" | head -1)" "$BIN_DIR/$name"
}

if has_version nvim "$NVIM_VERSION"; then
  echo "nvim $NVIM_VERSION already installed"
else
  echo "installing nvim $NVIM_VERSION"
  curl -fsSL "https://github.com/neovim/neovim/releases/download/v$NVIM_VERSION/nvim-linux-x86_64.tar.gz" | tar -xz -C "$TMP_DIR"
  rm -rf "$OPT_DIR/nvim-linux-x86_64"
  mv "$TMP_DIR/nvim-linux-x86_64" "$OPT_DIR/"
  ln -sfn "$OPT_DIR/nvim-linux-x86_64/bin/nvim" "$BIN_DIR/nvim"
fi

install_binary lazygit "$LAZYGIT_VERSION" "https://github.com/jesseduffield/lazygit/releases/download/v$LAZYGIT_VERSION/lazygit_${LAZYGIT_VERSION}_linux_x86_64.tar.gz"
install_binary delta "$DELTA_VERSION" "https://github.com/dandavison/delta/releases/download/$DELTA_VERSION/delta-$DELTA_VERSION-x86_64-unknown-linux-musl.tar.gz"
install_binary tuicr "$TUICR_VERSION" "https://github.com/agavra/tuicr/releases/download/v$TUICR_VERSION/tuicr-$TUICR_VERSION-x86_64-unknown-linux-musl.tar.gz"
install_binary rg "$RIPGREP_VERSION" "https://github.com/BurntSushi/ripgrep/releases/download/$RIPGREP_VERSION/ripgrep-$RIPGREP_VERSION-x86_64-unknown-linux-musl.tar.gz"
install_binary fd "$FD_VERSION" "https://github.com/sharkdp/fd/releases/download/v$FD_VERSION/fd-v$FD_VERSION-x86_64-unknown-linux-musl.tar.gz"
install_binary fzf "$FZF_VERSION" "https://github.com/junegunn/fzf/releases/download/v$FZF_VERSION/fzf-$FZF_VERSION-linux_amd64.tar.gz"

if has_version tree-sitter "$TREE_SITTER_VERSION"; then
  echo "tree-sitter $TREE_SITTER_VERSION already installed"
else
  echo "installing tree-sitter $TREE_SITTER_VERSION"
  curl -fsSL "https://github.com/tree-sitter/tree-sitter/releases/download/v$TREE_SITTER_VERSION/tree-sitter-linux-x64.gz" | gunzip > "$TMP_DIR/tree-sitter"
  install -m 755 "$TMP_DIR/tree-sitter" "$BIN_DIR/tree-sitter"
fi
