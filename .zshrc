ZSH=$HOME/.oh-my-zsh
ZSH_THEME="resure"
DISABLE_AUTO_UPDATE="true"
DISABLE_LS_COLORS="true"
COMPLETION_WAITING_DOTS="true"

plugins=(git bundler brew gem rbates)

export PATH=$HOME/.rbenv/bin:$HOME/.rbenv/shims:/usr/local/bin:/usr/local/bin:$PATH
source $HOME/.localrc

source $ZSH/oh-my-zsh.sh

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
