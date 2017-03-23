" Basic Settings

set nocompatible
filetype plugin indent on
syntax on
set backspace=indent,eol,start
set laststatus=2
set showmode
set showcmd

" Number

set number
set relativenumber

" Line wrap

set wrap
set linebreak

" Show invisible character
set list
set listchars=tab:▸\ ,eol:¬

" Setting search

nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
" set hlsearch
nnoremap <leader><space> :noh<cr>
nnoremap <tab> %
vnoremap <tab> %

" Disable swap file

set noswapfile

" TAB to SPACE setting

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

" File encoding

set encoding=utf-8
set fileencodings=ucs-bom,utf-8,utf-16,gbk,big5,gb18030,latin1
set fileformats=unix,dos

" Mappings and shortcuts

" Basics

" inoremap jk <ESC>
" let mapleader = ","
" nnoremap ; :

" Disable arrows

nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" Miscellaneous

vnoremap . :norm.<CR>
au FocusLost * :wa

" Control shorcuts

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
