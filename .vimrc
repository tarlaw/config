set nocompatible

" vim-plug
call plug#begin('~/.vim/plugged')

" git interface
Plug 'tpope/vim-fugitive'

" filesystem
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'kien/ctrlp.vim' 

" html
" Plug 'isnowfy/python-vim-instant-markdown'
" Plug 'jtratner/vim-flavored-markdown'
" Plug 'suan/vim-instant-markdown'
" Plug 'nelstrom/vim-markdown-preview'

" python sytax checker
Plug 'nvie/vim-flake8'
Plug 'vim-scripts/Pydiction'
Plug 'vim-scripts/indentpython.vim'
Plug 'scrooloose/syntastic'

" auto-completion stuff
Plug 'Valloric/YouCompleteMe'
Plug 'klen/rope-vim'
Plug 'ervandew/supertab'

" code folding
Plug 'tmhedberg/SimpylFold'

" theme
Plug 'altercation/vim-colors-solarized'
Plug 'jnurmine/Zenburn'

Plug 'tpope/vim-sensible'
Plug 'dhruvasagar/vim-table-mode'
Plug 'tarlaw/vim-evernote'
Plug 'tarlaw/vim-markdown-exporter'

call plug#end()

filetype plugin indent on    " enables filetype detection
let g:SimpylFold_docstring_preview = 1

" autocomplete
let g:ycm_autoclose_preview_window_after_completion=1

" custom keys
let mapleader=" "
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

"call togglebg#map("<F5>")
colorscheme zenburn
"set guifont=Monaco:h14

let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

set noswapfile

" turn on numbering
set nu

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

"------------Start Python PEP 8 stuff----------------
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

" Set the default file encoding to UTF-8:
set encoding=utf-8

" For full syntax highlighting:
let python_highlight_all=1
syntax on

" Keep indentation level from previous line:
autocmd FileType python set autoindent

" make backspaces more powerfull
set backspace=indent,eol,start


" Folding based on indentation:
autocmd FileType python set foldmethod=indent
" use space to open folds
nnoremap <space> za 
"----------Stop python PEP 8 stuff--------------

"js stuff"
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2

set textwidth=79
set foldlevel=99

set splitbelow
set splitright
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

let g:table_mode_corner = "|"

" common setting
set clipboard+=unnamedplus

" NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc()==0 && !exists("s:std_in") | NERDTree | endif
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$")==1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" CtrlP
let g:ctrlp_working_path_mode = 'ra'
