"  Comments in Vimscript start with a `"`.

" If you open this file in Vim, it'll be syntax highlighted for you.

" Vim is based on Vi. Setting `nocompatible` switches from the default
" Vi-compatibility mode and enables useful Vim functionality. This
" configuration option turns out not to be necessary for the file named
" '~/.vimrc', because Vim automatically enters nocompatible mode if that file
" is present. But we're including it here just in case this config file is
" loaded some other way (e.g. saved as `foo`, and then Vim started with
" `vim -u foo`).
set nocompatible

" Turn on syntax highlighting.
syntax on

" Disable the default Vim startup message.
set shortmess+=I

" Show line numbers.
set number

" This enables relative line numbering mode. With both number and
" relativenumber enabled, the current line shows the true line number, while
" all other lines (above and below) are numbered relative to the current line.
" This is useful because you can tell, at a glance, what count is needed to
" jump up or down to a particular line, by {count}k to go up or {count}j to go
" down.
set relativenumber

" Always show the status line at the bottom, even if you only have one window open.
set laststatus=2

" The backspace key has slightly unintuitive behavior by default. For example,
" by default, you can't backspace before the insertion point set with 'i'.
" This configuration makes backspace behave more reasonably, in that you can
" backspace over anything.
set backspace=indent,eol,start

" By default, Vim doesn't let you hide a buffer (i.e. have a buffer that isn't
" shown in any window) that has unsaved changes. This is to prevent you from "
" forgetting about unsaved changes and then quitting e.g. via `:qa!`. We find
" hidden buffers helpful enough to disable this protection. See `:help hidden`
" for more information on this.
set hidden

" This setting makes search case-insensitive when all characters in the string
" being searched are lowercase. However, the search becomes case-sensitive if
" it contains any capital letters. This makes searching more convenient.
set ignorecase
set smartcase

" Enable searching as you type, rather than waiting till you press enter.
set incsearch

" Unbind some useless/annoying default key bindings.
nmap Q <Nop> " 'Q' in normal mode enters Ex mode. You almost never want this.

" Disable audible bell because it's annoying.
set noerrorbells visualbell t_vb=

" Enable mouse support. You should avoid relying on this too much, but it can
" sometimes be convenient.
set mouse+=a

" Try to prevent bad habits like using the arrow keys for movement. This is
" not the only possible bad habit. For example, holding down the h/j/k/l keys
" for movement, rather than using more efficient movement commands, is also a
" bad habit. The former is enforceable through a .vimrc, while we don't know
" how to prevent the latter.
" Do this in normal mode...
nnoremap <Left>  :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up>    :echoe "Use k"<CR>
nnoremap <Down>  :echoe "Use j"<CR>
" ...and in insert mode
" inoremap <Left>  <ESC>:echoe "Use h"<CR>
" inoremap <Right> <ESC>:echoe "Use l"<CR>
" inoremap <Up>    <ESC>:echoe "Use k"<CR>
" inoremap <Down>  <ESC>:echoe "Use j"<CR>

" Tabstop config
set tabstop=2 softtabstop=0 expandtab shiftwidth=2 smarttab

" shortcut for :tabnew ~/.nvimrc
noremap <C-S> <ESC>:tabnew ~/.nvimrc<CR>
" noremap <C-S-S> <ESC>:so ~/.nvimrc<CR>

" ----------- Plugin configuration ------------ "
call plug#begin()


" ack 
Plug 'mileszs/ack.vim'

" auto pair parenthesis
Plug 'jiangmiao/auto-pairs'

" focus on working lines
Plug 'junegunn/limelight.vim'
let g:limelight_conceal_ctermfg = 'DarkGrey'
    
" ycm
Plug 'ycm-core/YouCompleteMe'
" no preview pop-up window
set completeopt-=preview
let g:ycm_show_diagnostics_ui = 0


"supertab
" Plug 'ervandew/supertab'
" let g:SuperTabDefaultCompletionType    = '<C-N>'
" let g:SuperTabCrMapping                = 0
let g:UltiSnipsExpandTrigger           = '<A-Space>'
let g:UltiSnipsJumpForwardTrigger      = '<C-J>'
let g:UltiSnipsJumpBackwardTrigger     = '<C-K>'

" let g:SuperTabCompletionType = "context"

" markdown
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
let g:mkdp_markdown_css='/home/samillynn/node_modules/github-markdown-css/github-markdown.css'


" ipython-vim
" Plug 'ivanov/vim-ipython'

Plug 'bfredl/nvim-ipy'
let g:nvim_ipy_perform_mappings = 0
map <F5> <Plug>(IPy-RunAll)
map <F6> <Plug>(IPy-Run)
imap <F5> <ESC><F5>
imap <F6> <ESC><F6>

"js
Plug 'pangloss/vim-javascript'

" highlight the current line
Plug 'miyakogi/conoline.vim'
let g:conoline_auto_enable = 1
let g:conoline_color_normal_dark = 'guibg=#333333 guifg=#dddddd'
let g:conoline_color_insert_dark = 'guibg=black guifg=white'

" powerline
Plug 'vim-airline/vim-airline'
let g:airline_powerline_fonts = 1

" git
Plug 'tpope/vim-fugitive'

" syntax check
Plug 'scrooloose/syntastic'
let g:syntastic_mode_map = {
        \"mode": "passive" }
" let g:syntastic_cpp_include_dirs = ['/usr/local/include','/usr/include', '/usr/lib/llvm-10/include']
" let g:syntastic_cpp_check_header = 1
let g:syntastic_python_python_exec = '/bin/python3.8'

" tagbar
Plug 'majutsushi/tagbar'
nmap <F8> :TagbarToggle<CR>

" ctrlp
Plug 'kien/ctrlp.vim'
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" vim-auto-save
Plug '907th/vim-auto-save' 
let g:auto_save = 1

" latex
Plug 'lervag/vimtex'
let g:vimtex_complete_enabled = 1
Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }
let g:tex_flavor = 'latex'

" easymotion
Plug 'easymotion/vim-easymotion'
map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)
map <Leader> <Plug>(easymotion-prefix)
nmap <Leader>s <Plug>(easymotion-bd-s)
nmap <Leader>e <Plug>(easymotion-bd-e)
nmap <S-E> <Plug>(easymotion-bd-e)s
vmap <Leader>e <Plug>(easymotion-bd-e)
nmap <Leader>w <Plug>(easymotion-bd-w)
vmap <Leader>w <Plug>(easymotion-bd-w)
nmap <Plug>f <Plug>(easymotion-bd-f)
" map  / <Plug>(easymotion-sn)
" omap / <Plug>(easymotion-tn)
" map  n <Plug>(easymotion-next)
" map  N <Plug>(easymotion-prev)
nmap <Leader>s <Plug>(easymotion-s2)
" nmap t <Plug>(easymotion-bd-tl)

" repeat.vim
Plug 'tpope/vim-repeat'
silent! call repeat#set("\<Plug>MyWonderfulMap", v:count)


" drucala theme
Plug 'dracula/vim', { 'as': 'dracula' }

" vim-surround
Plug 'tpope/vim-surround'

" nerdtree
Plug 'preservim/nerdtree'
map <A-1> :NERDTreeToggle<CR>

" jedi-vim
" Plug 'davidhalter/jedi-vim'
" let g:jedi#popup_on_dot = 0
" let g:jedi#popup_select_first = 1
" let g:jedi#show_call_signatures = 0
" autocmd FileType python setlocal completeopt-=preview
" let g:jedi#completions_command = "<C-Space>"
"let g:jedi#completions_enabled = 0

" deoplete.nvim
" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" let g:deoplete#enable_at_startup = 1
" call deoplete#enable()

" C/C++ completions
" Plug 'xavierd/clang_complete'
" let g:clang_library_path = "/usr/lib/llvm-10/lib"

" Track the engine.
Plug 'SirVer/ultisnips'

" Snippets are separated from the engine. Add this if you want them:
Plug 'honza/vim-snippets'
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsUsePythonVersion = 3

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
" let g:UltiSnipsExpandTrigger="<tab>"
" let g:UltiSnipsJumpForwardTrigger="<c-b>"
" let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
" Plug 'MarcWeber/vim-addon-mw-utils'
" Plug 'tomtom/tlib_vim'
" Plug 'garbas/vim-snipmate'
" 
" Plug 'honza/vim-snippets'


call plug#end()

colorscheme dracula



" normal mode
nnoremap ; :
vnoremap ; :
" nnoremap : <ESC>:tabnew 
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <CR> <C-w>w
nnoremap <A-h> <C-w>H
nnoremap <A-l> <C-w>L
nnoremap <A-j> <C-w>J
nnoremap <A-k> <C-w>K
nnoremap <A-a> G<S-A>
nnoremap <A-i> ggO
nnoremap <C-A> ea
nnoremap <C-o> bi
nnoremap <Tab> >>
nnoremap <S-Tab> <<
nnoremap <C-\> gt
nnoremap ' gt
nnoremap " gT

" insert mode
imap <C-a> <ESC><C-a>
imap <C-o> <ESC><C-o>
imap <A-a> <ESC><A-a>
imap <A-i> <ESC><A-i>
imap <A-S-A> <ESC><S-A>
imap <A-S-I> <ESC><S-I>
imap <C-\> <ESC><C-\>

" visual mode
vnoremap <Tab> >>
vnoremap <S-Tab> <<

" keep cursor always in middle
set scrolloff=13

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif


" no backup file
set nobackup


" copy to clipboard
vnoremap <C-S-C> "+y

" select-all
imap <C-S-A> <ESC><C-S-A>

" no highlight search
set nohlsearch

" fix filetype 
au BufRead .functions set filetype=sh
au BufRead .aliases set filetype=sh

