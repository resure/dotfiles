Clone repository and link config files to your home directory (example: `ln -s
   ~/dotfiles/tmux.conf ~/.tmux.conf`)

Don't forget to change credentials in gitconfig.

Additional steps for Zsh:

1. Create ~/.zshrc file with `source "{THIS_REPO_PATH}/zsh/zshrc"` content
2. Add `PS1="%n@%m:%~%# "` to your ~/.zshrc if you want to remove username and hostname from the prompt


Additional steps for Vim:

1. Create ~/.vimrc file with `source ~/.vim/vimrc` content
2. Create directories for swap and backup files:
`mkdir ~/.vim/{_backup,_temp}`
3. Install Vundle: `git clone https://github.com/gmarik/vundle.git
   ~/.vim/bundle/vundle`
4. Fetch packages:
`vim +BundleInstall +qall`
5. Install Ack,  `sudo apt-get install
   ack-grep' on Debian/Ubuntu, `brew install ack` on OS X

