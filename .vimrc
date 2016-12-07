" Maintainer:
"       Edward Fitz Abucay <eabucay@vastorigins.net>
"       http://www.vastorigins.com
"
" Version:
"       1.2
"
" Repository:
"       http://github.com/soardex/pastel.git

set nocompatible
syntax off

call pathogen#infect('bundle/{}')
call pathogen#helptags()

syntax enable
filetype plugin indent on

set shortmess+=filmnrxoOtT
set viewoptions=folds,options,cursor,unix,slash
set virtualedit=onemore

let g:solarized_termtrans=1
set t_Co=256
set background=dark
colorscheme solarized

set mouse=a
set mousehide
set encoding=utf-8
scriptencoding utf-8

set nu
set nohlsearch
set nowrap
set autoindent
set expandtab
set splitright
set splitbelow
set pastetoggle=<F3>
set winminheight=0

set nobackup
set nowb
set noswapfile

set history=1000
set hidden

set tabstop=4
set softtabstop=4
set shiftwidth=4

autocmd Filetype scala setlocal ts=2 sts=2 sw=2 et
autocmd Filetype html setlocal ts=2 sts=2 sw=2 et
autocmd Filetype ruby setlocal ts=2 sts=2 sw=2 et

set showmode

set tabpagemax=15
set cursorline

set ruler
set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%)
set showcmd

set laststatus=2

set backspace=indent,eol,start
set linespace=0
set showmatch
set incsearch
set ignorecase
set smartcase
set wildmode=list:longest,full
set listchars=tab:❘-,trail:·,extends:»,precedes:«,nbsp:×
set list

" change from to header file
cnoremap %% <C-R>=expand('%:h').'/'<cr>

" split and buffers mapping
map <leader>ew :e %%
map <leader>es :sp %%
map <leader>ev :vsp %%
map <leader>et :tabe %%

vnoremap < <gv
vnoremap > >gv
vnoremap . :normal .<CR>

" tags directories
set tags=./tags,~/.vim/tags

" nerdtree
nmap <silent> <C-E> :NERDTreeToggle<CR>

" save and quit shortcuts
nmap <F2> :w<CR>
nmap <F4> :q<CR>

" 2-character search motion easymotion
nmap s <Plug>(easymotion-s2)
nmap t <Plug>(easymotion-t2)

" enable sudo saving
cmap w!! w !sudo tee % > /dev/null

