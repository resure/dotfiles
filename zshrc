ZSH=$HOME/.oh-my-zsh

ZSH_THEME=""

DISABLE_AUTO_UPDATE="true"
HIST_STAMPS="mm/dd"

plugins=(git node npm vagrant)

source $ZSH/oh-my-zsh.sh

alias irc="TERM=screen-256color weechat-curses"
alias tm="tmux attach || tmux new"

extract () {
 if [ -f $1 ] ; then
   case $1 in
     *.tar.bz2) tar xjf $1    ;;
     *.tar.gz)  tar xzf $1    ;;
     *.bz2)     bunzip2 $1    ;;
     *.rar)     unrar x $1    ;;
     *.gz)      gunzip $1     ;;
     *.tar)     tar xf $1     ;;
     *.tbz2)    tar xjf $1    ;;
     *.tbz)     tar -xjvf $1  ;;
     *.tgz)     tar xzf $1    ;;
     *.zip)     unzip $1      ;;
     *.Z)       uncompress $1 ;;
     *.7z)      7z x $1       ;;
     *)         echo "I don't know how to extract '$1'..." ;;
   esac
 else
   echo "'$1' is not a valid file"
 fi
}

pk () {
 if [ $1 ] ; then
   case $1 in
     tbz) tar cjvf $2.tar.bz2 $2   ;;
     tgz) tar czvf $2.tar.gz  $2   ;;
     tar) tar cpvf $2.tar  $2      ;;
     bz2) bzip $2 ;;
     gz)  gzip -c -9 -n $2 > $2.gz ;;
     zip) zip -r $2.zip $2         ;;
     7z)  7z a $2.7z $2            ;;
     *)   echo "'$1' cannot be packed via pk()" ;;
   esac
 else
   echo "'$1' is not a valid file"
 fi
}

c() { cd ~/code/$1; }
_c() { _files -W ~/code -/; }
compdef _c c

h() { cd ~/$1; }
_h() { _files -W ~/ -/; }
compdef _h h

unsetopt correct_all

if [[ -n $SSH_CONNECTION ]]; then
  PROMPT='%m:%3~$(git_prompt_info)%# '
else
  PROMPT='%3~$(git_prompt_info)%# '
fi

ZSH_THEME_GIT_PROMPT_PREFIX="["
ZSH_THEME_GIT_PROMPT_SUFFIX="]"

watch_blocks() {
  ./node_modules/nodemon/bin/nodemon.js \
    -e js,yate,css \
    --watch desktop.blocks/ \
    --exec "make"
}

watch_bundle() {
  ./node_modules/nodemon/bin/nodemon.js\
    -e js,yate,css\
    --watch "desktop.blocks/$1/"\
    --exec "./node_modules/.bin/enb make desktop.bundles/$1 -n"
}

clck() {
  wget -qO- "http://clck.ru/--?url=$1"\ | pbcopy
}

nda() {
  wget -qO- "http://$nda_clck/--?url=$1"\ | pbcopy
}

if [[ -s "$HOME/.zlocal" ]] ; then
  source "$HOME/.zlocal"
fi

