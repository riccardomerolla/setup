#!/bin/bash
# Simple setup.sh for configuring Ubuntu 14.04 LTS EC2 instance
# for headless setup. 

sudo apt-get install -y git
sudo apt-get install -y curl wget

# Install emacs24
# https://launchpad.net/~cassou/+archive/emacs
sudo add-apt-repository -y ppa:cassou/emacs
sudo apt-get -qq update
sudo apt-get install -y emacs24-nox emacs24-el emacs24-common-non-dfsg

# Install zsh
sudo apt-get install -y zsh
curl -L https://raw.github.com/riccardomerolla/oh-my-zsh/master/tools/install.sh | sudo sh

# git pull and install dotfiles as well
cd $HOME
if [ -d ./dotfiles/ ]; then
    mv dotfiles dotfiles.old
fi
if [ -d .emacs.d/ ]; then
    mv .emacs.d .emacs.d~
fi
git clone https://github.com/riccardomerolla/dotfiles.git -b docker
ln -sb dotfiles/.screenrc .
ln -sb dotfiles/.bash_profile .
ln -sb dotfiles/.bashrc .
ln -sb dotfiles/.zshrc .
ln -sb dotfiles/.bashrc_custom .
ln -sf dotfiles/.emacs.d .

# Install docker
wget -qO- https://get.docker.com/ | sudo sh
sudo usermod -aG docker ubuntu


