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

if [ ! -e ~/.npmrc ]
then
    ln -s ~/Dotfiles/npmrc ~/.npmrc
fi

# install zsh and set as default shell
brew install zsh
sudo -s 'echo /usr/local/bin/zsh >> /etc/shells'
chsh -s /usr/local/bin/zsh

# install fzf
brew install fzf
# To install useful key bindings and fuzzy completion:
$(brew --prefix)/opt/fzf/install
# setup fzf config
rm ~/.fzf.zsh
ln -s ~/Dotfiles/fzf.zsh ~/.fzf.zsh

# install tmux
brew install tmux

# install vscode and setup settings
brew cask install visual-studio-code
rm ~/Library/Application\ Support/Code/User/settings.json
ln -s ~/Dotfiles/vscode/settings.json ~/Library/Application\ Support/Code/User/settings.json

# install slack
brew cask install slack

# install zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# install powerlevel9k for .oh-my-zsh
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k

# install vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

sh setup-defaults.sh
