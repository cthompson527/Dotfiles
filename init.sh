#!/bin/bash

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

if [ ! -e ~/.gitconfig ]
then
    ln -s ~/Dotfiles/gitconfig ~/.gitconfig
fi

if [ ! -e ~/.fzf.zsh ]
then
    ln -s ~/Dotfiles/.fzf.zsh ~/fzf.zsh
fi

# install zsh and set as default shell
brew install zsh
sudo -s 'echo /usr/local/bin/zsh >> /etc/shells' && chsh -s /usr/local/bin/zsh

# install fzf
brew install fzf
# To install useful key bindings and fuzzy completion:
$(brew --prefix)/opt/fzf/install

# install vscode and setup settings
brew cask instal visual-studio-code
rm ~/Library/Application\ Support/Code/User/settings.json
ln -s ~/Dotfiles/vscode/settings.json ~/Library/Application\ Support/Code/User/settings.json

# install slack
brew cask install slack
