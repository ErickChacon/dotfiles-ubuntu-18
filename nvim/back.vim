" Specify a directory for plugins (for Neovim: ~/.local/share/nvim/plugged)
call plug#begin('~/.local/share/nvim/plugged')
Plug 'morhetz/gruvbox' " colorscheme
" Make sure you use single quotes
Plug 'sickill/vim-monokai' " colorscheme
Plug 'ctrlpvim/ctrlp.vim' " for folders ans files
Plug 'tpope/vim-surround' " sorround
Plug 'tomtom/tcomment_vim' " easy comment
Plug 'vimwiki/vimwiki' " notes
Plug 'kana/vim-textobj-indent' " copy indented block
Plug 'kana/vim-textobj-user' " custom text object
Plug 'Yggdroot/indentLine' " show indentation
Plug 'SirVer/ultisnips' " snippets
Plug 'honza/vim-snippets' " snippets scripts
Plug 'scrooloose/nerdtree' " explore your filesystem and to open files
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ntpeters/vim-better-whitespace'
" Plug 'Shougo/deoplete.nvim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'icymind/NeoSolarized'
Plug 'mhartington/oceanic-next'
Plug 'epeli/slimux'
Plug 'edkolev/tmuxline.vim'
Plug 'ap/vim-css-color'
Plug 'tpope/vim-fugitive'
Plug 'lervag/vimtex'

" git
Plug 'airblade/vim-gitgutter' " shows added and remove lines
" Initialize plugin system
call plug#end()

let mapleader = " " " Leader - ( Spacebar )
let maplocalleader = "\\" " Leader - ( Spacebar )
set backspace=2 " Backspace deletes like most programs in insert mode
set nobackup " avoid create backup automatically
set nowritebackup " save: avoid new-delete-rename
set history=50 " history of the last commands
set ruler " row and column position
set laststatus=2 " Always display the status line
set encoding=utf-8 " Necessary to show Unicode glyphs
set autowrite     " Automatically :write before running commands
set autoread      " Reload files changed outside vim
" Trigger autoread when changing buffers or coming back to vim in terminal.
au FocusGained,BufEnter * :silent! !
set number " show line number
set numberwidth=4
set relativenumber
" set splitright " use in vnew
set title
set hlsearch "highlight searches
set incsearch    " search as characters are entered
set ignorecase    " case insensitive searching (unless specified)
set smartcase
nnoremap <silent> <leader>, :noh<cr> " Stop highlight after searching
set showmatch

" syntax enable " allow syntax colors
set background=dark " incompatible with colorscheme
" highlight Normal ctermfg=grey ctermbg=darkblue
" colorscheme desert
" colorscheme solarized
" let g:gruvbox_italic=1
" set t_Co=256 " allow 256 colors and use external colorschemes
" let g:gruvbox_contrast_dark = "soft"
let g:gruvbox_contrast_light = "soft"
" let g:gruvbox_italic = 1
" let g:gruvbox_italicize_comments = 1
" let g:gruvbox_number_column = "red"
" let g:gruvbox_invert_signs = 1
set termguicolors
colorscheme gruvbox

set shiftwidth=2
set softtabstop=2   " number of spaces in tab when editing
set expandtab       " tabs are spaces
set showcmd         " show incomplete command in bottom bar
set cursorline      " highlight current line
set visualbell      " stop the annoying beeping
filetype indent on  " load filetype-specific indent files R,
set wildmenu        " nice visual autocomplete for command menu
set wildmode=list:longest,full " full menu
set lazyredraw          " redraw only when we need to.
set showmatch           " highlight matching [{()}]
set clipboard=unnamedplus " copy to clipboard

"Allow usage of mouse in iTerm
set ttyfast
set mouse=a

" Make it obvious where 100 characters is
set textwidth=80
 " set formatoptions=cq
set formatoptions=qrn1
set wrapmargin=0
set colorcolumn=+1

" airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

" tmuxline
if exists('$TMUX')
    autocmd VimEnter * call tmuxline#set_statusline('vim_statusline_3')
endif

map <leader>tx :Tmuxline vim_statusline_3<CR>

" swap background colors
nnoremap <Leader>bg :let &background = ( &background == "dark"? "light" : "dark" )<CR> \| :hi! link FoldColumn GruvboxRed<CR> \| :hi! link Folded GruvboxYellowSign<CR>
" Control P settings
" let g:ctrlp_map = '<c-p>'
" let g:ctrlp_cmd = 'CtrlP'
" let g:ctrlp_working_path_mode = 'ra'

" NerdTree settings
" :nmap \n :NERDTreeToggle<CR>
set splitright
map <leader>n :NERDTreeToggle<CR>
let NERDTreeMapOpenInTab='T'
let NERDTreeMapOpenInTabSilent='t'

" nmap <C-c><C-c> :ScreenSend<cr> " normal mode
" nmap <C-j> V:ScreenSend<cr>j " normal mode
" vmap <C-j> :ScreenSend<cr> " visual mode
" cmap <C-j> ScreenSend<cr> " console
" nmap <C-c><C-x> :ScreenQuit<cr>

nmap <C-c><C-c> :SlimuxREPLSendBuffer<CR>
nmap <C-j> V:SlimuxREPLSendLine<CR>j
vmap <C-j> :SlimuxREPLSendLine<CR>
cmap <C-j> SlimuxREPLSendLine<cr> " console
vmap <C-s> :SlimuxREPLSendSelection<CR>
" map \fn <C-R>=expand("%:t:r")<CR>
map <C-c>r :exe "SlimuxShellRun source('" . expand("%:p") . "')"<CR>
" '+ exe ":normal i" . expand("%:t")'
" map <C-c>r :SlimuxShellRun ls() . expand("%:h")<CR>
" doeswork = expand("%:h") . ".bak"
"

" Go to the last cursor location when a file is opened, unless this is a
" git commit (in which case it's annoying)
au BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$") && &filetype != "gitcommit" |
      \ execute("normal `\"") |
  \ endif

" Neovim terminal emulator colors, based on gruvbox
let g:terminal_color_0 = '#665c54'
let g:terminal_color_1 = '#fb4934'
let g:terminal_color_2 = '#83a598'
let g:terminal_color_3 = '#d79921'
let g:terminal_color_4 = '#b16286'
let g:terminal_color_5 = '#458588'
let g:terminal_color_6 = '#b8bb26'
let g:terminal_color_7 = '#d65d0e'
let g:terminal_color_8 = '#a89984'
let g:terminal_color_9 = '#fb4934'
let g:terminal_color_10 = '#8ec07c'
let g:terminal_color_11 = '#fabd2f'
let g:terminal_color_12 = '#d3869b'
let g:terminal_color_13 = '#689d6a'
let g:terminal_color_14 = '#98971a'
let g:terminal_color_15 = '#fe8019'

" indentline to exclude tex files
let g:indentLine_fileTypeExclude = ['tex', 'markdown']

" Use deoplete.
let g:deoplete#enable_at_startup = 1

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetDir=[$HOME.'/Documents/Nvim/UltiSnips'] " where to create my snippets
let g:UltiSnipsSnippetDirectories=["UltiSnips", $HOME.'/Documents/Nvim/UltiSnips'] " It is necessary to define defaults snippets and your directory
" let g:UltiSnipsSnippetDirectories=["UltiSnips", "mycoolsnippets"]
" Add markdown snippets to vimwiki buffer
au FileType vimwiki :UltiSnipsAddFiletypes markdown

" Recoganize tex as latex
let g:tex_flavor = 'tex'

" Latex shortcuts
nnoremap <localleader>lt :VimtexTocOpen<CR>
nnoremap <localleader>lv :VimtexView<CR>
nnoremap <localleader>ll :VimtexCompileToggle<CR>
nnoremap <localleader>lo :VimtexCompileSS<CR>
nnoremap <localleader>le :VimtexErrors<CR>
nnoremap <localleader>lc :VimtexClean<CR>

" Vimkiwi setup
let g:vimwiki_list = [{'path':'$HOME/Documents/Nvim/Vimwiki',
                     \ 'syntax': 'markdown', 'ext': '.md'}]
let g:vimwiki_table_mappings = 0
let g:vimwiki_char_bold = '*'
let g:vimwiki_char_italic = '_'
" inoremap <silent><buffer> <expr><Right> pumvisible() ? deoplete#close_popup() : "<CR>"
" inoremap <F13> <Esc>:VimwikiReturn 1 5<CR>
" nmap <Leader>w <Plug>VimwikiIndex
" nmap <Leader>wf <Plug>VimwikiFollowLink
" nmap <Leader>wn <Plug>VimwikiNextLink
" imap <Leader>wn <Plug>vimwiki_i_<CR>
" inoremap <Leader> <CR> <C-r>=<SID>my_cr_function()<CR>
" function! s:my_cr_function() abort
"   return deoplete#close_popup() . "\<CR>"
" endfunction
" map <buffer> <C-G> :s/^/\/\//<Esc><Esc>

" Spelling
" set spell spelllang=en_us
" set spell

" Fold setup
function! MyFoldText() " {{{
    let line = getline(v:foldstart)

    let nucolwidth = &fdc + &number * &numberwidth
    let windowwidth = winwidth(0) - nucolwidth - 12
    let foldedlinecount = v:foldend - v:foldstart

    " expand tabs into spaces
    let onetab = strpart('          ', 0, &tabstop)
    let line = substitute(line, '\t', onetab, 'g')

    let line = strpart(line, 0, windowwidth - 2 -len(foldedlinecount))
    let fillcharcount = windowwidth - len(line) - len(foldedlinecount)
    return line . ' ' . repeat(" ",fillcharcount) . '--> ' . foldedlinecount . ' lines ' . ' '
endfunction " }}}

set foldmethod=marker
set foldtext=MyFoldText()
set foldlevel=1
set foldcolumn=2
" highlight FoldColumn guifg=#fb4934
" highlight Folded guifg=#fabd2f
hi! link FoldColumn GruvboxRed
hi! link Folded GruvboxYellowSign
" hi! link Folded VimCommentTitle
"
"
" let r_syntax_folding = 1 " need improves foolding
let vimtex_fold_enabled = 1
