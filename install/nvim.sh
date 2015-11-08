#!/bin/zsh

echo "installing neovim..."

sudo apt-get install software-properties-common
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt-get update
sudo apt-get install neovim


echo "done installing neovim!"
echo "installing prereqs for all python modules..."

sudo apt-get install python-dev python-pip python3-dev python3-pip
sudo pip2 install neovim
sudo pip3 install neovim

echo "done installing all of the python prereqs for neovim"
echo "configuring editor defaults for neovim"

sudo update-alternatives --install /usr/bin/vi vi /usr/bin/nvim 60
sudo update-alternatives --config vi
sudo update-alternatives --install /usr/bin/vim vim /usr/bin/nvim 60
sudo update-alternatives --config vim
sudo update-alternatives --install /usr/bin/editor editor /usr/bin/nvim 60
sudo update-alternatives --config editor







