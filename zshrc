autoload -U promptinit; promptinit
prompt pure

source ~/.aliases
source ~/.functions
source ~/.localrc

# Stop on slashes while deleting
autoload -U select-word-style
select-word-style bash

HISTFILE=~/.zsh_history
HISTSIZE=999999999
SAVEHIST=$HISTSIZE

