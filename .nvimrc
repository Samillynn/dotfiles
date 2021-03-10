set nocompatible
" Turn on syntax highlighting.
syntax on

" Disable the default Vim startup message.
set shortmess+=I

" Show line numbers and relativenumbers
set number
set relativenumber

" Always show the status line at the bottom, even if you only have one window open.
set laststatus=2

" Allow backspace on everything.
set backspace=indent,eol,start

" enalbe hiden buffers
set hidden

" Seach case insensitive if all characters are lower-case.
set ignorecase
set smartcase

" Enable searching as you type, rather than waiting till you press enter.
set incsearch

" Unbind some useless/annoying default key bindings.
nmap Q <Nop> " 'Q' in normal mode enters Ex mode. You almost never want this.

" Enable mouse support.
set mouse+=a

" Tabstop config
set tabstop=2 softtabstop=0 expandtab shiftwidth=2 smarttab


" ----------- Plugin configuration ------------ "
call plug#begin()

" powerline
Plug 'vim-airline/vim-airline'
let g:airline_powerline_fonts = 1

" git
Plug 'tpope/vim-fugitive'

" vim-auto-save
Plug '907th/vim-auto-save' 
let g:auto_save = 1
let g:auto_save_silent = 1

" drucala theme
" Plug 'dracula/vim', { 'as': 'dracula' }

" vim-surround
Plug 'tpope/vim-surround'

" cpbooster
Plug 'searleser97/cpbooster.vim'

" latex
Plug 'lervag/vimtex'

" auto-pair
"
call plug#end()

" colorscheme dracula


" ---------------- Key Bindings ----------------- "
nnoremap <space> <nop>
let mapleader=" "
nnoremap <C-M> <C-W>w
inoremap jk <esc>
cnoremap jk <esc>
vnoremap jk <esc>
nnoremap <leader>q :wq<cr>
nnoremap <leader>w :w<cr>
inoremap <C-k> <esc>O
