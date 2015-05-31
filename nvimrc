" enable plugin manager
call plug#begin('~/.nvim/plugged')

Plug 'kien/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'bling/vim-airline'
Plug 'embear/vim-localvimrc'
Plug 'jeffkreeftmeijer/vim-numbertoggle'

" Plug 'scrooloose/syntastic'
Plug 'benekastah/neomake'

Plug 'mileszs/ack.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'altercation/vim-colors-solarized'
Plug 'airblade/vim-gitgutter'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-surround'
Plug 'muffs/wap-it'

Plug 'groenewege/vim-less'
Plug 'pangloss/vim-javascript'

Plug 'reedes/vim-pencil'
Plug 'junegunn/goyo.vim'

call plug#end()

filetype plugin indent on
syntax enable


" Color config
"---------------
set t_Co=256
set background=dark
colorscheme solarized
let g:airline_theme = 'solarized'


" Basic conf
"---------------

set history=1000
set hlsearch
set incsearch

set showcmd
set wrap
set number

set autoread

" default tab settings
set expandtab
set tabstop=2 shiftwidth=2 softtabstop=2
set autoindent

" remember undo history
set undofile
set undodir=~/.nvim/undofile/

" wildcard search ignore
set wildignore=log/**,node_modules/**,tmp/**
set completeopt=menu,preview
set ignorecase

set cursorline
set scrolloff=3  " always have 3 lines showing above/below scroll pos

set laststatus=2  " always show status bar

set backupdir=~/.vim/_backup//    " where to put backup files.
set directory=~/.vim/_temp//      " where to put swap files.

" j/k move within line instead of skipping lines
map j gj
map k gk

set clipboard=unnamed

set mouse=a


" Keyboard shortcuts
" --------------------

let mapleader = ','

" ctrl+direction to navigate panes
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l


nmap <leader>a :Ack<space>
nmap <leader>b :CtrlPBuffer<CR>
nmap <leader>d :NERDTreeToggle<CR>
nmap <leader>f :NERDTreeFind<CR>
nmap <leader>t :CtrlP<CR>
nmap <leader>T :CtrlPClearCache<CR>:CtrlP<CR>
nmap <leader>g :GitGutterToggle<CR>
map <silent> <leader>V :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>
nnoremap <silent> <C-e> :<C-u>call ToggleErrors()<CR>

map <C-n> :NERDTreeToggle<CR>


" Ack conf
" --------------------

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
" Main advantage: respects .gitignore!
" brew install the_silver_searcher
if executable('ag')
  let g:ackprg = 'ag --nogroup --column' " Use in Ack.vim

  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""' " Use in CtrlP

  " bind K to grep word under cursor
  nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
  " bind \ (backward slash) to grep shortcut
  command! -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
  nnoremap \ :Ag<SPACE>
endif


" Nerdtree conf
" --------------------
let NERDTreeShowBookmarks=1
let NERDTreeChDirMode=0
let NERDTreeQuitOnOpen=0
let NERDTreeMouseMode=2
let NERDTreeShowHidden=1
let NERDTreeIgnore=['\.pyc','\~$','\.swo$','\.swp$','\.git$','\.hg','\.svn','\.bzr', '\.DS_Store']
let NERDTreeKeepTreeInNewTab=1
let g:nerdtree_tabs_open_on_gui_startup=0

" auto-open nerd tree if no files are specified
autocmd vimenter * if !argc() | NERDTree | endif


" Syntastic conf
" --------------------
" let g:syntastic_always_populate_loc_list=0
" let g:syntastic_auto_loc_list=0
" let g:syntastic_enable_signs=1
"
" let syntastic_mode_map = { 'passive_filetypes': ['html', 'less'] }
" let g:syntastic_python_checkers=['pyflakes']
" let g:syntastic_javascript_checkers=['eslint']


" Neomake conf
" --------------------
let g:neomake_javascript_enabled_makers = ['eslint']

autocmd! BufWritePost * Neomake


" Prose mode
" --------------------
let g:prosemode_active = 0
let g:goyo_width=100

function! ToggleProseMode()
  if g:prosemode_active
    let g:prosemode_active = 0
    Goyo
    NoPencil
  else
    let g:prosemode_active = 1
    Goyo 100
    SoftPencil
  endif
endfunction

nnoremap <leader>w :call ToggleProseMode()<cr>


" Misc conf
" --------------------
let g:airline_powerline_fonts = 1

let g:slime_target = "tmux"
