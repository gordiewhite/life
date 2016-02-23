#!/bin/bash

echo "Installing dotfiles"

echo "Initializing submodule(s)"
git submodule update --init --recursive

if [ "$(uname)" -eq  "Linux" ]; then
    echo "Installing all linux cli tools"
    source install/apt-get.sh
fi

if [ "$(uname)" -eq  "Darwin" ]; then
    echo "Running on OSX"

    echo "Brewing all the things"
    source install/brew.sh

    echo "Updating OSX settings"
    source installosx.sh

    # echo "Installing node (from nvm)"
    # source install/nvm.sh

    # echo "Configuring nginx"
    # create a backup of the original nginx.conf
    # mv /usr/local/etc/nginx/nginx.conf /usr/local/etc/nginx/nginx.original
    # ln -s ~/.dotfiles/nginx/nginx.conf /usr/local/etc/nginx/nginx.conf
    # symlink the code.dev from dotfiles
    # ln -s ~/.dotfiles/nginx/code.dev /usr/local/etc/nginx/sites-enabled/code.dev
fi

echo "installing neovim"
source install/nvim.sh

echo "creating all of the symlinks"
source install/link.sh

echo "installing fonts"
cd .config/fonts
./install.sh
cd ../..

echo "creating vim directories"
mkdir -p ~/.vim-tmp

echo "Configuring zsh as default shell"
chsh -s $(which zsh)

echo "importing eighties dark terminal theme on OSX"
if [ "$(uname)" -eq "Darwin" ]; then
    open .config/base16-eighties.dark.terminal
fi
echo "Done."
