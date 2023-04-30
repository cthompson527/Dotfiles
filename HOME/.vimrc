"Map Settings for pageUp and pageDown
map fj <C-f>
map fk <C-b>

" Quicker Escaping between normal and editing mode.
inoremap jj <ESC>
inoremap jk <ESC>

" Make vim incompatbile to vi.
set nocompatible
set modelines=0

"TAB settings.
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

" More Common Settings.
set encoding=utf-8
set scrolloff=3
set autoindent
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set visualbell
syntax on
filetype plugin indent on

"set cursorline
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2

"set relativenumber. to turn off relative, change relativenumber to norelative
"number
set number
set relativenumber

"set undofile
set shell=/usr/local/bin/zsh
set lazyredraw
set matchtime=3

"Changing Leader Key
let mapleader = "\\"

"Pathogen
execute pathogen#infect()

colorscheme onedark


