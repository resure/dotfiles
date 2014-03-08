Clone repository and link config files to your home directory (example: `ln -s
   ~/dotfiles/tmux.conf ~/.tmux.conf`)

Don't forget to change credentials in gitconfig.

Additional steps for Zsh:

1. Install Oh My Zsh: `curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh`


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

