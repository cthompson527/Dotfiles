#! /bin/env bash

set -euxo pipefail

#### initial setup of mirrors... ####
curl -Lo ~/mirrorlist 'https://archlinux.org/mirrorlist/?country=US&protocol=http&protocol=https&ip_version=4'
sed -i 's/#S/S/g' ~/mirrorlist
sudo mv -v ~/mirrorlist /etc/pacman.d/mirrorlist
sudo pacman -S --noconfirm pacman-contrib

#### determine fastest mirrors... ####
rankmirrors -n 10 --max-time 1 /etc/pacman.d/mirrorlist > ~/mirrorlist.fastest
sudo mv -v ~/mirrorlist.fastest /etc/pacman.d/mirrorlist

#### update system... ####
sudo pacman -Syu --noconfirm

#### installing dependencies... ####
sudo pacman -S --noconfirm base-devel cmake unzip ninja tree-sitter curl git nodejs ncurses libffi glib2 lazygit tmux
sudo pacman -S --noconfirm community/tig community/ripgrep community/yarn
sudo pacman -S --noconfirm extra/llvm extra/clang extra/python-pip

#### retrieving dotfiles... ####
git clone https://gitlab.com/cthompson527/dotfiles.git ~/dotfiles
ln -s ~/dotfiles/tmux.conf ~/.tmux.conf
ln -s ~/dotfiles/vimrc ~/.vimrc
ln -s ~/dotfiles/gitconfig ~/.gitconfig

#### installing neovim... ####
git clone https://github.com/neovim/neovim
pushd neovim
make -j4
sudo make install
popd

#### installing pathogen... ####
mkdir -p ~/.config/nvim/autoload ~/.config/nvim/bundle
curl -LSso ~/.config/nvim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
mkdir ~/.vim
ln -s ~/.config/nvim/autoload ~/.vim/autoload
ln -s ~/.config/nvim/bundle ~/.vim/bundle
echo 'source ~/.vimrc' >  ~/.config/nvim/init.vim

#### installing plugins... ####
pushd ~/.config/nvim/bundle
git clone https://github.com/joshdick/onedark.vim.git
git clone https://github.com/tpope/vim-fugitive.git
git clone https://github.com/preservim/nerdtree.git
git clone https://github.com/nvim-lua/plenary.nvim.git
git clone https://github.com/nvim-telescope/telescope.nvim.git
git clone https://github.com/neoclide/coc.nvim.git
	pushd coc.nvim
	yarn install
	popd
popd
nvim +'CocInstall -sync coc-clangd' +qall

#### setup git... ####
git config --global user.email "cory.thompson527@gmail.com"
git config --global user.name "Cory Thompson"

#### install conan... ####
pip install conan

