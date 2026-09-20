# dotfiles

Personal environment for two kinds of machines: a macOS laptop (where the kitty terminal runs) and Linux x86_64 dev servers reached over SSH. Work on the server happens inside [herdr](https://herdr.dev) panes: coding agents write the code, and the tools below are for reading it and reviewing their changes.

## Reproducing the environment

```sh
git clone git@github.com:resure/dotfiles.git ~/code/dotfiles
~/code/dotfiles/install.sh
```

`install.sh` is safe to run repeatedly. It:

1. symlinks the configs listed below into `$HOME`; anything already present and not pointing into this repo is reported as `SKIPPED` and left alone, so resolve those by hand;
2. runs `install-cli-tools.sh`, which installs nvim, lazygit, delta, tuicr, ripgrep, fd and fzf: through Homebrew on macOS, as pinned release binaries into `~/.local/bin` on Linux x86_64 (no root needed; `~/.local/bin` must be on `PATH`);
3. restores nvim plugins to the commits pinned in `nvim/lazy-lock.json`.

Not automated:

- Shell startup. On macOS `zshrc` is linked and sources `~/.aliases`, `~/.functions` and `~/.localrc` (machine-local, not in the repo; create it, even empty). On Linux the stock `~/.bashrc` stays and needs `source ~/.aliases` and `source ~/.functions` added.
- herdr itself and its plugins are installed separately; only its `config.toml` lives here.
- `macos.sh` (Finder and keyboard defaults) and `brew.sh` (an old Homebrew package list, mostly stale) are run by hand if wanted.
- `gitconfig` carries a personal name and email.

## What is here

| Path | Linked to | Purpose |
|---|---|---|
| `gitconfig`, `gitignore_global` | `~/.gitconfig`, `~/.gitignore_global` | git aliases, delta as pager, nvim as editor |
| `aliases`, `functions` | `~/.aliases`, `~/.functions` | shell aliases and helpers, shared by bash and zsh |
| `zshrc` | `~/.zshrc` (macOS) | zsh options, prompt, history |
| `nvim/` | `~/.config/nvim` | [LazyVim](https://lazyvim.org) with TypeScript and JSON extras |
| `lazygit/` | `~/.config/lazygit` (Linux), `~/Library/Application Support/lazygit` (macOS) | lazygit with delta as its diff pager |
| `herdr/config.toml` | `~/.config/herdr/config.toml` | herdr theme, prefix key, UI |
| `kitty/` | `~/.config/kitty` (macOS) | kitty config with light and dark themes that follow the system |
| `osx/Library/KeyBindings/` | `~/Library/KeyBindings/` (macOS) | same text shortcuts across input sources |

## Daily workflow

- `nvim`: browse the project (`<space>e` tree, `<space><space>` files, `<space>sg` grep, `<space>gg` lazygit). Pressing `<space>` and waiting shows every binding.
- `tuicr -w` (uncommitted changes) or `tuicr -r master..HEAD` (a branch): review an agent's diff like a pull request. `c` comments a line, `v` selects a range first, `C` comments the file, `y` copies the whole review as markdown to paste to the agent, `?` lists keys.
- `lazygit`: stage hunks, commit, discard.
- `git diff`, `git show`, `git log -p` render through delta; `n`/`N` jump between files.

## Updating tools

Bump the version variables at the top of `install-cli-tools.sh` and rerun it; tools already at the pinned version are skipped. For nvim plugins run `:Lazy update` and commit the changed `nvim/lazy-lock.json`.
