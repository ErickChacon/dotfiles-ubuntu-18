
" MAPPING AND KEYBOARD
let mapleader = "\\"                         " map leader as backslash (default)
let maplocalleader = "\\"                    " map localleader as backslash
set backspace=indent,eol,start               " use backspace to delete in insert mode

" MODIFICATIONS
set autoread                                 " read changes outside nvim
au FocusGained * :checktime                  " read changes outside nvim
set backupcopy=yes                           " able to edit docker volumne file
set autowrite                                " save when moving between buffers
" set autowriteall                             " save when edit
au FocusGained,BufEnter * :silent!           " update file when entering buffer
set history=50                               " history of the last commands ':'

" MOUSE AND CLIPBOARD USAGE
set mouse=a                                  " allow use of mouse
set clipboard+=unnamedplus                   " copy to clipboard

" SEARCHES
set hlsearch                                 " highlight searches
set incsearch                                " search as characters are entered
set ignorecase                               " case insensitive searching
set smartcase                                " override ignorecase when upper characters
" stop highlight after searching
nnoremap <silent> <leader>, :noh<cr>

" INDENTATION
set shiftwidth=4                             " indentation size
set softtabstop=4                            " number of spaces per tab
set expandtab                                " tabs are spaces

" ROW NUMBERS FORMAT
set number                                   " show line number
set numberwidth=4                            " width
set relativenumber                           " relative

" TEXTWIDTH AND WRAPING
set textwidth=85                             " textwidth
set formatoptions=cqt                        " text wraping
" set colorcolumn=+1                           " color column after textwidth
" let &colorcolumn="".join(range(91,999),",")  " color column after textwidth
set nojoinspaces                             " join sentences with one space

" VISUAL SETTINGS
set title                                       " window title
" set showmatch                                   " show matching brackets for a moment
let loaded_matchparen = 1
set cursorline                                  " highlight current line
set fillchars+=vert:\│                          " split separator
hi VertSplit guibg=NONE guifg=#1d2021 gui=none  " split separator color

" MENU OPTIONS
set wildmenu                                 " nice visual autocomplete for command menu
set wildmode=list:longest,full               " full menu

" UPDATE WINDOW AND ERROR SOUND
set lazyredraw                               " redraw only when we need to
set visualbell                               " stop the annoying beeping


" ADDITIONAL NVIM SETTING

" Go to the last cursor location when a file is opened
au BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$") && &filetype != "gitcommit" |
      \ execute("normal `\"") |
  \ endif

" Forcing vimdiff to wrap lines
autocmd FilterWritePre * if &diff | setlocal wrap< | endif

" Mapping jk to get out of insert, visual and terminal mode
inoremap jk <Esc>
inoremap <esc> <nop>
vnoremap jk <Esc>
vnoremap <esc> <nop>
tnoremap jk <C-\><C-n>

" " Mapping to close brackets
" inoremap ( ()<left>
" inoremap [ []<left>
" inoremap { {}<left>

" Disable Arrow keys in normal, visual, operator-pending and insert mode
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

" Mapping g-[hjkl] to select split in normal mode
nmap <silent> gk :wincmd k<CR>
nmap <silent> gj :wincmd j<CR>
nmap <silent> gh :wincmd h<CR>
nmap <silent> gl :wincmd l<CR>

" initvim
nnoremap <leader>ve :split $MYVIMRC<cr>
nnoremap <leader>vs :source $MYVIMRC<cr>
