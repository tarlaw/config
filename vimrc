" vim-plug
call plug#begin('~/.vim/plugged')

" filesystem
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'jistr/vim-nerdtree-tabs'

" python sytax checker
Plug 'nvie/vim-flake8'
Plug 'vim-scripts/Pydiction'
Plug 'vim-scripts/indentpython.vim'
Plug 'scrooloose/syntastic'

" auto-completion stuff
Plug 'klen/python-mode'
Plug 'ervandew/supertab'

" code folding
Plug 'tmhedberg/SimpylFold'

" theme
Plug 'morhetz/gruvbox'
Plug 'itchyny/lightline.vim'
Plug 'Yggdroot/indentLine'

"
Plug 'mileszs/ack.vim'
Plug 'vim-scripts/YankRing.vim'
Plug 'tpope/vim-surround'
Plug 'vim-scripts/scratch.vim'
Plug 'kien/rainbow_parentheses.vim'

" markdown
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'

Plug 'mattn/emmet-vim'

call plug#end()

"
" base config
"

set nocompatible
set modelines=0

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

set encoding=utf-8
set scrolloff=3
set autoindent
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set visualbell
set cursorline
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
set relativenumber
set undofile
set fileencodings=ucs-bom,utf-8,utf-16,gbk,big5,gb18030,latin1
set fileformats=unix,dos

" change leader key
let mapleader = ","

" setting search
nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch
nnoremap <leader><space> :noh<cr>
nnoremap <tab> %
vnoremap <tab> %

" handle long line correct
set wrap
set textwidth=79
set formatoptions=qrn1
set colorcolumn=80

" show invisible character
set list
set listchars=tab:▸\ ,eol:¬


" disable arrow key
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
nnoremap j gj
nnoremap k gk

" bind escape key
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>
nnoremap ; :

" save on losing focus
au FocusLost * :wa

" strip all trailing whitespace in the current file
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

" map to ack
nnoremap <leader>a :Ack

" reselect text
nnoremap <leader>v V`]

" quicker escape
inoremap jj <ESC>

" quicker split window
set splitbelow
set splitright
nnoremap <leader>w <C-w>v<C-w>l

" simple switch window
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" clipboard setting
set clipboard+=unnamedplus

" disable swap file
set noswapfile

" Set the default file encoding to UTF-8:
set encoding=utf-8

" use space to open folds
nnoremap <space> za 

" theme
" call togglebg#map("<F5>")
" colorscheme zenburn
colorscheme gruvbox
set background=dark
set guifont=Menlo:h12

"
" base end
"

" simpylfold setting
filetype plugin indent on
let g:SimpylFold_docstring_preview = 1
set foldlevel=99

" python with virtualenv support
py << EOF
import os.path
import sys
import vim
if 'VIRTUA_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  sys.path.insert(0, project_base_dir)
  activate_this = os.path.join(project_base_dir,'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF

" it would be nice to set tag files by the active virtualenv here
" :set tags=~/mytags "tags for ctags and taglist
" omnicomplete
autocmd FileType python set omnifunc=pythoncomplete#Complete

"
" python pep 8 stuff
"

" Number of spaces that a pre-existing tab is equal to.
au BufRead,BufNewFile *py,*pyw,*.c,*.h set tabstop=4

" spaces for indents
au BufRead,BufNewFile *.py,*pyw set shiftwidth=4
au BufRead,BufNewFile *.py,*.pyw set expandtab
au BufRead,BufNewFile *.py set softtabstop=4

" Use the below highlight group when displaying bad whitespace is desired.
highlight BadWhitespace ctermbg=red guibg=red

" Display tabs at the beginning of a line in Python mode as bad.
au BufRead,BufNewFile *.py,*.pyw match BadWhitespace /^\t\+/
" Make trailing whitespace be flagged as bad.
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" Wrap text after a certain number of characters
au BufRead,BufNewFile *.py,*.pyw, set textwidth=100

" Use UNIX (\n) line endings.
au BufNewFile *.py,*.pyw,*.c,*.h set fileformat=unix

" For full syntax highlighting:
let python_highlight_all=1
syntax on

" Keep indentation level from previous line:
autocmd FileType python set autoindent

" make backspaces more powerfull
set backspace=indent,eol,start

" Folding based on indentation:
autocmd FileType python,xml,html,xhtml setlocal foldmethod=indent
autocmd Syntax c,cpp,vim setlocal foldmethod=syntax

"
" python pep 8 stuff end
"

"js stuff"
autocmd FileType javascript,html,css setlocal shiftwidth=2 tabstop=2

" NERDTree setting
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc()==0 && !exists("s:std_in") | NERDTree | endif
map <leader>n :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$")==1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

" CtrlP
let g:ctrlp_working_path_mode = 'ra'

" rainbow parenthsis setting
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0

let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall

let g:pydiction_location = '/Users/law/.vim/plugged/Pydiction/complete-dict'

" let g:indentLine_char = '|'
" let g:indentLine_enabled = 1
