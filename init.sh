#!/bin/bash

sudo apt-get install -y git

if [ -d ~/Dotfiles ]
then
    cd ~/Dotfiles
    git pull origin master
else
    git clone https://github.com/cthompson527/Dotfiles.git ~/Dotfiles
fi


# Got to Git repo
cd ~/Dotfiles

# Initilize the Reop.
git submodule init
git submodule update

# Got to home.
cd

# Check the file exists or not.
if [ ! -d ~/.vim ]
then
    ln -s ~/Dotfiles/vim-files/vim ~/.vim
fi

if [ ! -e ~/.vimrc ]
then
    ln -s ~/Dotfiles/vim-files/vim/vimrc ~/.vimrc
fi

if [ ! -e ~/.tmux.conf ]
then
    ln -s ~/Dotfiles/tmux.conf ~/.tmux.conf
fi

if [ ! -e ~/.zshrc ]
then
    ln -s ~/Dotfiles/zsh/zshrc ~/.zshrc
fi

if [ ! -e ~/.oh-my-zsh ]
then
    ln -s ~/Dotfiles/zsh/oh-my-zsh ~/.oh-my-zsh
fi

# Intiall vim with all scripting language support and add python dependencies.
sudo apt-get install vim-nox ruby-dev python-dev python3-dev python-pip python3-pip

# Build the command-t
cd ~/Dotfiles/vim-files/vim/bundle/Command-T/ruby/command-t
ruby extconf.rb
make

