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

syntax on
filetype plugin indent on

set shortmess+=filmnrxoOtT
set viewoptions=folds,options,cursor,unix,slash
set virtualedit=onemore

set background=dark

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

" vim theme
hi IncSearch ctermfg=65 ctermbg=114 cterm=NONE
hi WildMenu ctermfg=65 ctermbg=114 cterm=NONE
hi SignColumn ctermfg=NONE ctermbg=NONE cterm=NONE
hi SpecialComment ctermfg=71 ctermbg=236 cterm=bold
hi Typedef ctermfg=114 ctermbg=NONE cterm=bold
hi Title ctermfg=114 ctermbg=236 cterm=bold
hi Folded ctermfg=71 ctermbg=NONE cterm=NONE
hi PreCondit ctermfg=114 ctermbg=NONE cterm=bold
hi Include ctermfg=114 ctermbg=NONE cterm=bold
hi TabLineSel ctermfg=120 ctermbg=65 cterm=bold
hi StatusLineNC ctermfg=10 ctermbg=NONE cterm=bold,underline
hi NonText ctermfg=59 ctermbg=NONE cterm=NONE
hi DiffText ctermfg=114 ctermbg=65 cterm=bold
hi ErrorMsg ctermfg=196 ctermbg=NONE cterm=NONE
hi Debug ctermfg=71 ctermbg=236 cterm=bold
hi PMenuSbar ctermfg=NONE ctermbg=235 cterm=NONE
hi Identifier ctermfg=114 ctermbg=NONE cterm=NONE
hi SpecialChar ctermfg=71 ctermbg=236 cterm=bold
hi Conditional ctermfg=114 ctermbg=NONE cterm=bold
hi StorageClass ctermfg=114 ctermbg=NONE cterm=bold
hi Todo ctermfg=236 ctermbg=71 cterm=NONE
hi Special ctermfg=71 ctermbg=236 cterm=bold
hi LineNr ctermfg=65 ctermbg=NONE cterm=NONE
hi StatusLine ctermfg=120 ctermbg=65 cterm=bold
hi Normal ctermfg=71 ctermbg=NONE cterm=NONE
hi Label ctermfg=114 ctermbg=NONE cterm=bold
hi PMenuSel ctermfg=114 ctermbg=65 cterm=NONE
hi Search ctermfg=236 ctermbg=71 cterm=NONE
hi Delimiter ctermfg=71 ctermbg=236 cterm=bold
hi Statement ctermfg=120 ctermbg=NONE cterm=NONE
hi Comment ctermfg=65 ctermbg=NONE cterm=NONE
hi Character ctermfg=120 ctermbg=NONE cterm=NONE
hi Float ctermfg=114 ctermbg=238 cterm=NONE
hi Number ctermfg=114 ctermbg=238 cterm=NONE
hi Boolean ctermfg=114 ctermbg=238 cterm=NONE
hi Operator ctermfg=114 ctermbg=NONE cterm=bold
hi CursorLine ctermfg=NONE ctermbg=NONE cterm=underline
hi TabLineFill ctermfg=NONE ctermbg=NONE cterm=bold
hi Question ctermfg=71 ctermbg=NONE cterm=NONE
hi WarningMsg ctermfg=114 ctermbg=NONE cterm=NONE
hi VisualNOS ctermfg=71 ctermbg=NONE cterm=NONE
hi DiffDelete ctermfg=236 ctermbg=236 cterm=NONE
hi ModeMsg ctermfg=71 ctermbg=NONE cterm=NONE
hi Define ctermfg=114 ctermbg=NONE cterm=bold
hi Function ctermfg=114 ctermbg=NONE cterm=NONE
hi FoldColumn ctermfg=65 ctermbg=234 cterm=NONE
hi PreProc ctermfg=114 ctermbg=NONE cterm=bold
hi Visual ctermfg=114 ctermbg=65 cterm=NONE
hi MoreMsg ctermfg=71 ctermbg=NONE cterm=NONE
hi VertSplit ctermfg=236 ctermbg=236 cterm=NONE
hi Exception ctermfg=114 ctermbg=NONE cterm=bold
hi Keyword ctermfg=114 ctermbg=NONE cterm=bold
hi Type ctermfg=114 ctermbg=NONE cterm=bold
hi DiffChange ctermfg=114 ctermbg=65 cterm=NONE
hi Cursor ctermfg=65 ctermbg=114 cterm=NONE
hi Error ctermfg=196 ctermbg=NONE cterm=NONE
hi PMenu ctermfg=NONE ctermbg=235 cterm=NONE
hi SpecialKey ctermfg=242 ctermbg=NONE cterm=NONE
hi Constant ctermfg=120 ctermbg=NONE cterm=NONE
hi Tag ctermfg=71 ctermbg=236 cterm=bold
hi String ctermfg=114 ctermbg=238 cterm=NONE
hi PMenuThumb ctermfg=NONE ctermbg=65 cterm=NONE
hi Repeat ctermfg=114 ctermbg=NONE cterm=bold
hi Directory ctermfg=114 ctermbg=NONE cterm=bold
hi Structure ctermfg=114 ctermbg=NONE cterm=bold
hi Macro ctermfg=114 ctermbg=NONE cterm=bold
hi Underlined ctermfg=114 ctermbg=NONE cterm=underline
hi DiffAdd ctermfg=114 ctermbg=65 cterm=NONE
hi TabLine ctermfg=65 ctermbg=NONE cterm=bold
hi cursorim ctermfg=65 ctermbg=114 cterm=NONE
hi lcursor ctermfg=65 ctermbg=114 cterm=NONE
hi condtional ctermfg=123 ctermbg=NONE cterm=NONE
hi pmenum ctermfg=240 ctermbg=234 cterm=NONE
hi char ctermfg=114 ctermbg=238 cterm=NONE

