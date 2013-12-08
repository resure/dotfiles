
1. Install Powerline
   (http://askubuntu.com/questions/283908/how-can-i-install-and-use-powerline-plugin, system-wide installation so you should fix powerline path in tmux and zsh configs if you want to use per-user method)
2. Link config files to your home directory (example: `ln -s
   ~/dotfiles/tmux.conf ~/.tmux.conf`)

Additional steps for Zsh:

1. Create ~/.zshrc file with `source "{THIS_REPO_PATH}/zsh/zshrc"` content

Additional steps for Vim:

1. Create ~/.vimrc file with `source ~/.vim/vimrc` content
2. Create directories for swap and backup files:
`mkdir ~/.vim/{_backup,_temp}`
3. Fetch packages:
`vim +BundleInstall +qall`

