# Dotfiles

This is a collection of all the dotfiles and configuration that I use for my workflow. This repository has been modeled off of another vim + tmux workflow.
If you have any questions about how this all works, please ping me.

## Contents

+ [Initial Setup and Installation](#initial-setup-and-installation)
+ [ZSH Setup](#zsh-setup)
+ [Vim and Neovim Setup](#vim-and-neovim-setup)
+ [Tmux Configuration](#tmux-configuration)
+ [Git configuration](#git-configuration)
+ [OSX configuration](osx-configuration)
+ [Homebrew](#homebrew)
+ [Node Installation](#node-installation)

## Initial Setup and Installation

If on OSX, you will need to install the XCode CLI tools before continuing. To do so, open a terminal and type

```bash
xcode-select --install
```

Then, clone the dotfiles repository to your computer. This can be placed anywhere, and symbolic links will be created to reference it from your home directory.

```bash
git clone https://github.com/nicknisi/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
./install.sh
```

`install.sh` will start by initializing the submodules used by this repository. Then, it will install all symbolic links into your home directory. Every file with a `.symlink` extension will be symlinked to the home directory with a `.` in front of it. As an example, `vimrc.symlink` will be symlinked in the home directory as `~/.vimrc`. Then, this script will create a `~/.vim-tmp` directory in your home directory, as this is where vim is configured to place its temporary files. Additionally, all files in the `$DOTFILES/config` directory will be symlinked to the `~/.config/` directory for applications that follow the [XDG base directory specification](http://standards.freedesktop.org/basedir-spec/basedir-spec-latest.html), such as neovim.

Next, the install script will perform a check to see if it is running on an OSX machine. If so, it will install Homebrew if it is not currently installed and will install the homebrew packages listed in [`brew.sh`](install/brew.sh). Then, it will run [`installosx.sh`](installosx.sh) and change some OSX configurations. This file is pretty well documented and so it is advised that you __read through and comment out any changes you do not want__. Next, the script will call [`install/nvm.sh`](install/nvm.sh) to install Node.js (stable) using nvm.

There are a few steps left over in order to get everything set up the way I like it. These could not be automated by a script because they require human interaction.

1) Open vim by typing `vim` into the terminal. Run the `:PlugInstall` command in order to download all of my plugins.
2) head back th `~/.dotfiles/install` and type `./snippets.sh`. This will properly initialize all of my custom snippets with autocompletion.
3) Change your shell profile settings in order to use the Base16-eighties dark theme by default, and change your font to `Inconsolata for Powerline Plus Nerd File Types Plus Octicons Plus Pomicons Medium`

After that you should be good to go!

If you are seeing blue numbers in the side of your console when you are using vim. It is because the font installation script changes your settings during installation. Run `source ~/.dotfiles/.config/base16-shell/base16-eighties.dark.sh` in order to change the shell colors back to the proper values.


## ZSH Setup

ZSH is configured in the `zshrc.symlink` file, which will be symlinked to the home directory. The following occurs in this file:

* set the `EDITOR` to nvim
* Load any `~/.terminfo` setup
* Set the `CODE_DIR` variable, pointing to the location where the code projects exist for exclusive autocompletion with the `c` command
* Recursively search the `$DOTFILES/zsh` directory for files ending in .zsh and source them
* source a `~/.localrc` if it exists so that additional configurations can be made that won't be kept track of in this dotfiles repo. This is good for things like API keys, etc.
* Add the `~/bin` and `$DOTFILES/bin` directories to the path
* Setup NVM, RVM, and hub if they exist
* Set the base16 colorscheme to use for both the terminal (gnome-terminal) and vim/neovim by exporting the `$THEME` and `$BACKGROUND` environment variables
* And more...

### Prompt

The prompt is meant to be simple while still providing a lot of information to the user, particularly about the status of the git project, if the PWD is a git project. This prompt sets `precmd`, `PROMPT` and `RPROMPT`.

The `precmd` shows the current working directory in it and the `RPROMPT` shows the git and suspended jobs info.

#### Prompt Git Info

The git info shown on the `RPROMPT` displays the current branch name, and whether it is clean or dirty.

Additionally, there are ⇣ and ⇡ arrows that indicate whether a commit has happened and needs to be pushed (⇡), and whether commits have happened on the remote branch that need to be pulled (⇣).

#### Suspended Jobs

The prompt will also display a ✱ character in the `RPROMPT` indicating that there is a suspended job that exists in the background. This is helpful in keeping track of putting vim in the background by pressing CTRL-Z.

## Vim and Neovim Setup

vim and neovim should just work once the correct plugins are installed. To install the plugins, you will need to open vim/neovim in the following way:

for vim
```bash
vim +PlugInstall
```

for neovim
```bash
nvim +PlugInstall
```

### Fonts

Currently I am using the Inconsolata font with Powerline support so that I can have good looking file icons when I use the NERDTree plugin in vim. If you would like to add any other fonts into your system, add the proper .otf file to `~/.dotfiles/.config/fonts/patched-fonts` directory.

-----

+ zsh configuration
+ vim configuration
+ tmux configuration
+ git configuration
+ osx configuration
+ Node.js setup (nvm)
+ Homebrew

## Install

1. `git clone https://github.com/nicknisi/dotfiles.git ~/.dotfiles`
1. `cd ~/.dotfiles`
1. `./install.sh`

## ZSH Plugins

By default, the `.zshrc` file will source any file within `.dotfiles/zsh` that have the `.zsh` extension.

## Vim Plugins

Vim plugins are managed with [vim-plug](https://github.com/junegunn/vim-plug). To install, run `vim +PlugInstall`.
