" testitexn"
" Neovim settings
" Language:	Vim
" Last Change:	22 Jun 2017
"
" PLUGINS {{{
call plug#begin('~/.local/share/nvim/plugged')

" Motions
" Plug 'tpope/vim-commentary' " easy comment and uncomment: slow for rmd
Plug 'tomtom/tcomment_vim' " easy comment: nice for rmd
" Plug 'scrooloose/nerdcommenter'

call plug#end()
" }}}
" GENERAL SETTING {{{

" syntax enable
" let mapleader = " " " Leader - ( Spacebar ) \ by default
let maplocalleader = "\\"
set backspace=2 " Backspace deletes like most programs in insert mode
set nobackup " avoid create backup automatically
set nowritebackup " save: avoid new-delete-rename
set history=50 " history of the last commands
set ruler " row and column position
set encoding=utf-8 " Necessary to show Unicode glyphs
set autowrite     " Automatically :write before running commands
set autoread      " Reload files changed outside vim
au FocusGained,BufEnter * :silent! " Check if file has changed externally
set showmatch " Show matching brackets just for a moment.
set title " window title

if exists("g:gui_oni")
  " Turn off statusbar, because it is externalized
  set noruler
  set laststatus=0 " 2: Always display the status line
  set noshowcmd
  set noshowmode " hide the default status mode
else
  set laststatus=2 " 2: Always display the status line
endif

set number " show line number
set numberwidth=4
set relativenumber

set hlsearch "highlight searches
set incsearch    " search as characters are entered
set ignorecase    " case insensitive searching (unless specified)
set smartcase
nnoremap <silent> <leader>, :noh<cr> " Stop highlight after searching

set shiftwidth=2
set softtabstop=2   " number of spaces in tab when editing
set expandtab       " tabs are spaces
" set showcmd         " show incomplete command in bottom bar
set cursorline      " highlight current line
set visualbell      " stop the annoying beeping
filetype indent on  " load filetype-specific indent files R,
filetype plugin on " for markdown preview
set wildmenu        " nice visual autocomplete for command menu
set wildmode=list:longest,full " full menu
set lazyredraw          " redraw only when we need to.
" set showmatch           " highlight matching [{()}]
set clipboard=unnamedplus " copy to clipboard

"Allow usage of mouse in iTerm
set ttyfast
set mouse=a

" Make it obvious where 100 characters is
set textwidth=85
set formatoptions=cqt " it changes depending of the filetype
" set wrapmargin=0
" set formatoptions=cq
" set formatoptions=qrn1
" set wrapmargin=0
set colorcolumn=+1
" let &colorcolumn="10,".join(range(70,999),",")
let &colorcolumn="".join(range(91,999),",")
" let &colorcolumn=range(86,999)
" highlight ColorColumn ctermbg=0 guibg=lightgrey
" augroup vimrc_autocmds
"   autocmd BufEnter * highlight OverLength ctermbg=darkgrey guibg=#592929
"   autocmd BufEnter * match OverLength /\%50v.*/
" augroup END
" Highlight long lines (>80)
" }}}
