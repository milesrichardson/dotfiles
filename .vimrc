" 'K=============== Vundle =============== "
" set the runtime path to include Vundle and initialize
set nocompatible              " be iMproved, reqquired
filetype off                  " required

execute pathogen#infect()
syntax on
filetype plugin indent on


" ============ default Syntastic settings ============= "
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0


" =============== General .vimrc stuff ================ "

" use the OS clipboard by default (on versions compiled with `+clipboard`)
set clipboard=unnamed
" Optimize for fast terminal connections
set ttyfast
" Highlight dynamically as pattern is typed
set incsearch
" Make tabs as wide as two spaces
set tabstop=2
" Show “invisible” characters
set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_
set list
" Highlight searches
set hlsearch
" Ignore case of searches
set ignorecase
" Disable error bells
set noerrorbells
" Start scrolling three lines before the horizontal window border
set scrolloff=3
" Show the filename in the window titlebar
set title
" Don’t reset cursor to start of line when moving around.
set nostartofline
" Enable line numbers
set number

:set ruler

set smartindent
set tabstop=4
set shiftwidth=4
set expandtab

syntax on
colorscheme twilight256

if has("mouse")
    set mouse=a
endif

" map 'jk' to <Esc>
:imap jk <Esc>

" show line numbers
set nu

" remap ; to :
cnoremap <expr> ; getcmdpos() == 1 ? '<C-F>A' : ';'
silent! nunmap ;
silent! nunmap :
nnoremap <unique> ; :
nnoremap <unique> : ;
" TODO: map ';;' to exit-insert && ';'

" highlight search results
set hlsearch
nnoremap jk :noh<return>jk

" allow cursor to be one char past EOL
set virtualedit=onemore

" enable cursor wrapping
set whichwrap+=<,>,h,l,[,]

" set qq to ignore changes -> quit
cabbrev qq q!

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

set splitbelow
set splitright

" in-vim cmd to edit vimrc, then source on save/close
map <leader>vimrc :tabe ~/.vimrc<cr>
autocmd bufwritepost .vimrc source $MYVIMRC

" correct backspace behavior
set backspace=indent,eol,start
