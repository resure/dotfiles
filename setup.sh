

echo "deb http://apt.postgresql.org/pub/repos/apt/ wheezy-pgdg main" | sudo tee /etc/apt/sources.list.d/pgdg.list
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -

echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' | sudo tee /etc/apt/sources.list.d/mongodb.list
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10

sudo add-apt-repository ppa:webupd8team/java

sudo apt-get update
sudo apt-get -y upgrade
sudo apt-get -y dist-upgrade
sudo apt-get install build-essential curl erlang haskell-platform golang emacs vim vim-gtk git zsh tmux redis-server ack-grep mongodb-10gen postgresql-common postgresql-contrib ipython ipython-qtconsole ipython3 ipython3-qtconsole python-pip python3-pip oracle-java8-installer gnome-tweak-tool unity-tweak-tool fonts-droid fonts-dejavu virtualbox

if [ ! -z "$LAPTOP" ]
then
  sudo add-apt-repository ppa:linrunner/tlp
  sudo apt-get update
  sudo apt-get install tlp tlp-rdw powertop

  if [ "$LAPTOP" = "thinkpad" ]
  then
    sudo apt-get install tp-smapi-dkms acpi-call-tools
  fi
fi

curl https://install.meteor.com/ | sh
wget -qO- https://toolbelt.heroku.com/install-ubuntu.sh | sh
\curl -sSL https://get.rvm.io | bash -s stable
curl https://raw.github.com/creationix/nvm/v0.4.0/install.sh | sh

source ~/.nvm/nvm.sh
nvm install 0.10
nvm alias default 0.10
nvm use 0.10
npm -g install coffee-script pm2 meteorite

source ~/.rvm/scripts/rvm
rvm requirements
rvm install 2.1
rvm --default use 2.1
gem install pry awesome_print

sudo pip install httpie

curl -L http://install.ohmyz.sh | sh
rm ~/.zshrc

ln -s $PWD/zshrc ~/.zshrc
ln -s $PWD/vim ~/.vim
ln -s $PWD/gemrc ~/.gemrc
ln -s $PWD/gitconfig ~/.gitconfig
ln -s $PWD/gitignore_global ~/.gitignore_global
ln -s $PWD/gtkrc-2.0 ~/.gtkrc-2.0
ln -s $PWD/irbrc ~/.irbrc
ln -s $PWD/tmux.conf ~/.tmux.conf
echo "source ~/.vim/vimrc" > ~/.vimrc
mkdir ~/.vim/{_backup,_temp}
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
vim +BundleInstall +qall

chsh -s /bin/zsh

