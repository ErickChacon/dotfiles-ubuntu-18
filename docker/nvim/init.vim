" testitexn"
" Neovim settings
" Language:	Vim
" Last Change:	22 Jun 2017
"
" PLUGINS {{{

so ~/.config/nvim/plugins.vim

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
" ADDITIONAL NVIM SETTING {{{
" to get out of terminal insert mode
tnoremap jk <C-\><C-n>

" Go to the last cursor location when a file is opened, unless this is a
" git commit (in which case it's annoying)
au BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$") && &filetype != "gitcommit" |
      \ execute("normal `\"") |
  \ endif


ino " ""<left>
autocmd FileType r,python inoremap ' ''<left>
ino ( ()<left>
ino [ []<left>
ino { {}<left>
autocmd FileType tex,pandoc inoremap $ $$<left>
ino {<CR> {<CR>}<ESC>O


" Disable Arrow keys in Escape mode
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

" Disable Arrow keys in Insert mode
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>

" Mapping esc to jk and disable the old key
inoremap jk <Esc>
inoremap <esc> <nop>

vnoremap jk <Esc>
" vnoremap jk <Esc>gV
" inoremap jk <Esc>
" inoremap <esc> <nop>

" Use ctrl-[hjkl] to select the active split!
" nmap <silent> <c-k> :wincmd k<CR>
" nmap <silent> <c-j> :wincmd j<CR>
" nmap <silent> <c-h> :wincmd h<CR>
" nmap <silent> <c-l> :wincmd l<CR>
nmap <silent> gk :wincmd k<CR>
nmap <silent> gj :wincmd j<CR>
nmap <silent> gh :wincmd h<CR>
nmap <silent> gl :wincmd l<CR>

" Forcing vimdiff to wrap lines
autocmd FilterWritePre * if &diff | setlocal wrap< | endif

" }}}
" COLORSCHEME {{{
" Colorscheme vim options
set termguicolors
syntax enable " allow syntax colors

if exists("g:gui_oni")
  " set background=light " incompatible with colorscheme
  set background=dark " incompatible with colorscheme
else
  set background=dark " incompatible with colorscheme
endif
" set background=light " incompatible with colorscheme

" Gruvbox colorscheme
let g:gruvbox_italic = 1
let g:gruvbox_italicize_strings = 1
let g:gruvbox_italicize_comments = 1
let g:gruvbox_contrast_dark = "soft"
let g:gruvbox_contrast_light = "soft"
" let g:gruvbox_color_column = "bg2"
" let g:gruvbox_vert_split='dark0_hard'
" let g:gruvbox_number_column = "red"
" let g:gruvbox_invert_signs = 1

" Nord colorscheme
let g:nord_italic = 1
let g:nord_italic_comments = 1
let g:nord_comment_brightness = 20
let g:nord_statusline_uniform = 0

" Deus colorscheme
let g:deus_bold=0
let g:deus_italic=1

" Neodark colorscheme
" let g:neodark#use_256color = 1
let g:neodark#italics = 1

" spelling problem
" let g:spacegray_low_contrast = 1
" colorscheme spacegray
" guifg=#8be9fd gui=none
" colorscheme synthwave
" colorscheme hybrid
" colorscheme alduin
" colorscheme janah
" colorscheme angr

" high contrast
" colorscheme base16-tomorrow-night
" colorscheme OceanicNext
" colorscheme base16-default-dark
" colorscheme monokai
" colorscheme srcery
" colorscheme lucid
" colorscheme happy_hacking
" let g:deepspace_italics=1
" colorscheme deep-space
" colorscheme jellybeans
" colorscheme abstract
" colorscheme tender

" low contrast
" colorscheme Tomorrow-Night
" let g:neosolarized_contrast = "high"
" let g:neosolarized_bold = 1
" let g:neosolarized_underline = 1
" let g:neosolarized_italic = 1
" colorscheme NeoSolarized
" colorscheme stellarized_dark
" colorscheme anderson
" colorscheme crunchbang
" colorscheme two-firewatch
" let g:airline_theme='twofirewatch'
" colorscheme nefertiti

let g:nvim_id = system("pgrep -x 'nvim' | sed -n 1p")
" echo g:nvim_id

function! Random()
python3 << EOF
import random
import vim
random.seed(int(vim.eval("g:nvim_id")))
value = random.randrange(1, 9)
vim.command("let g:random_number = %s"% value)
EOF
endfunction

call Random()
" echo g:random_number


if exists("g:gui_oni")
  colorscheme nord
  " colorscheme material-theme
  " colorscheme gruvbox
else
  if g:random_number == 1
    colorscheme nord
    hi Conceal guibg=NONE guifg=#8be9fd gui=none
    hi Folded gui=none guibg=#3b4252 guifg=#7b88a1
    hi Title gui=bold guifg=#d8dee9
  elseif g:random_number == 2
    colorscheme gruvbox
    hi link Function GruvboxAqua
  elseif g:random_number == 3
    colorscheme material-theme
    hi Conceal guibg=NONE guifg=#F77669 gui=none
  elseif g:random_number == 4
    colorscheme deus
  hi texBeginEnd gui=bold,italic guifg=#ffffff
  elseif g:random_number == 5
    let g:one_allow_italics = 1
    colorscheme one
    call one#highlight('Folded', '5c6370', '2c323c', 'italic')
    " call one#highlight('Conceal', '5c6370', '2c323c')
    hi Conceal guibg=NONE guifg=#e5c07b gui=none
  elseif g:random_number == 6
    colorscheme dracula
    hi Conceal guibg=NONE guifg=#8be9fd gui=none
    hi Folded guibg=#333333 guifg=#6272a4 gui=none
  elseif g:random_number == 7
    colorscheme neodark
    hi SpellBad guibg=none guifg=none gui=underline
    hi Folded guibg=#263a45 guifg=#658595
  elseif g:random_number == 8
    colorscheme space-vim-dark
    hi Conceal guibg=none guifg=#2aa1ae
    hi SpellBad guibg=none guifg=none gui=underline
    hi Function gui=none
    hi Folded gui=none
    hi Comment gui=italic guifg=#2A6B74
  " elseif g:random_number == 9
  "   colorscheme challenger_deep
  "   hi Conceal guibg=none guifg=#ff5458
  "   hi Folded gui=none guibg=#100e23 guifg=#767676
  "   hi SpellBad guibg=none guifg=none gui=underline
  endif
endif

let g:profile_id = system('dconf read /org/gnome/terminal/legacy/profiles:/default')
let g:profile_id = substitute(g:profile_id, "\n", "", "g")
let g:profile_id = substitute(g:profile_id, "'", "", "g")
let g:nvim_background = synIDattr(synIDtrans(hlID('Normal')), 'bg', 'gui')
let g:nvim_foreground = synIDattr(synIDtrans(hlID('Normal')), 'fg', 'gui')
call system('dconf write /org/gnome/terminal/legacy/profiles:/:' . g:profile_id . '/background-color ' . "'".'"' . g:nvim_background . '"'."'")
call system('dconf write /org/gnome/terminal/legacy/profiles:/:' . g:profile_id . '/foreground-color ' . "'".'"' . g:nvim_foreground . '"'."'")

let g:COLOR_01 = synIDattr(synIDtrans(hlID('Visual')), 'bg', 'gui')
" let g:COLOR_02 = synIDattr(synIDtrans(hlID('WarningMsg')), 'fg', 'gui')
" let g:COLOR_02 = synIDattr(synIDtrans(hlID('WarningMsg')), 'bg', 'gui')
" let g:COLOR_02 = synIDattr(synIDtrans(hlID('Statement')), 'fg', 'gui')
let g:COLOR_02 = synIDattr(synIDtrans(hlID('Type')), 'fg', 'gui')
let g:COLOR_03 = synIDattr(synIDtrans(hlID('Identifier')), 'fg', 'gui') " Precision
" let g:COLOR_03 = synIDattr(synIDtrans(hlID('Function')), 'fg', 'gui') " Precision
" let g:COLOR_03 = synIDattr(synIDtrans(hlID('Normal')), 'fg', 'gui') " Precision
" let g:COLOR_03 = synIDattr(synIDtrans(hlID('Comment')), 'fg', 'gui') " Precision
" let g:COLOR_03 = synIDattr(synIDtrans(hlID('Conceal')), 'fg', 'gui') " Precision
" let g:COLOR_04 = synIDattr(synIDtrans(hlID('Type')), 'fg', 'gui')
let g:COLOR_04 = synIDattr(synIDtrans(hlID('Number')), 'fg', 'gui')
let g:COLOR_05 = synIDattr(synIDtrans(hlID('Number')), 'fg', 'gui')
let g:COLOR_06 = synIDattr(synIDtrans(hlID('Identifier')), 'fg', 'gui')
" let g:COLOR_07 = synIDattr(synIDtrans(hlID('DiffAdd')), 'fg', 'gui')
let g:COLOR_07 = synIDattr(synIDtrans(hlID('String')), 'fg', 'gui')
let g:COLOR_08 = synIDattr(synIDtrans(hlID('Special')), 'fg', 'gui')
" "
" let g:COLOR_09 = synIDattr(synIDtrans(hlID('MatchParen')), 'bg', 'gui')
let g:COLOR_09 = synIDattr(synIDtrans(hlID('Visual')), 'bg', 'gui')
let g:COLOR_10 = synIDattr(synIDtrans(hlID('Statement')), 'fg', 'gui')
" let g:COLOR_10 = synIDattr(synIDtrans(hlID('WarningMsg')), 'bg', 'gui')
" let g:COLOR_10 = synIDattr(synIDtrans(hlID('Todo')), 'fg', 'gui')
" let g:COLOR_10 = synIDattr(synIDtrans(hlID('ErrorMsg')), 'fg', 'gui')
" let g:COLOR_10 = synIDattr(synIDtrans(hlID('ErrorMsg')), 'fg', 'gui')
" if g:COLOR_10[0:5] == g:nvim_foreground[0:5]
"   let g:COLOR_10 = synIDattr(synIDtrans(hlID('ErrorMsg')), 'bg', 'gui')
" endif
" let g:COLOR_10 = synIDattr(synIDtrans(hlID('Number')), 'fg', 'gui')
" let g:COLOR_11 = synIDattr(synIDtrans(hlID('PreProc')), 'fg', 'gui') " chaconmo
" let g:COLOR_11 = synIDattr(synIDtrans(hlID('Structure')), 'fg', 'gui') " chaconmo
" let g:COLOR_11 = synIDattr(synIDtrans(hlID('Include')), 'fg', 'gui') " chaconmo
let g:COLOR_11 = synIDattr(synIDtrans(hlID('Define')), 'fg', 'gui') " chaconmo
" let g:COLOR_12 = synIDattr(synIDtrans(hlID('DiffText')), 'fg', 'gui')
let g:COLOR_12 = synIDattr(synIDtrans(hlID('CursorLineNr')), 'fg', 'gui')
" let g:COLOR_12 = synIDattr(synIDtrans(hlID('Search')), 'fg', 'gui')
let g:COLOR_13 = synIDattr(synIDtrans(hlID('Number')), 'fg', 'gui')
let g:COLOR_14 = synIDattr(synIDtrans(hlID('DiffChange')), 'fg', 'gui')
let g:COLOR_15 = synIDattr(synIDtrans(hlID('Function')), 'fg', 'gui')
let g:COLOR_16 = synIDattr(synIDtrans(hlID('TypeDef')), 'fg', 'gui')

" let g:COLOR_01 = "#ffffff"
" let g:COLOR_02 = "#ffffff" " na and git files
" let g:COLOR_03 = "#ffffff" " R normal text
" let g:COLOR_04 = "#ffffff" " R numbers
" let g:COLOR_05 = "#ffffff"

" let g:COLOR_06 = "#ffffff"
" let g:COLOR_07 = "#ffffff" " R string
" let g:COLOR_08 = "#ffffff"

" let g:COLOR_09 = "#ffffff"
" let g:COLOR_10 = "#ffffff" " error message in R

" let g:COLOR_11 = "#ffffff"
" let g:COLOR_12 = "#ffffff"
" let g:COLOR_13 = "#ffffff"
" let g:COLOR_14 = "#ffffff"
" let g:COLOR_15 = "#ffffff"
" let g:COLOR_16 = "#ffffff"

call system('dconf write /org/gnome/terminal/legacy/profiles:/:' . g:profile_id . '/palette "[' . "'" . g:COLOR_01 . "', '" . g:COLOR_02 . "', '" . g:COLOR_03 . "', '" . g:COLOR_04 . "', '" . g:COLOR_05 . "', '" . g:COLOR_06 . "', '" . g:COLOR_07 . "', '" . g:COLOR_08 . "', '" . g:COLOR_09 . "', '" . g:COLOR_10 . "', '" . g:COLOR_11 . "', '" . g:COLOR_12 . "', '" . g:COLOR_13 . "', '" . g:COLOR_14 . "', '" . g:COLOR_15 . "', '" . g:COLOR_16 . "'" . ']"')


" Toggle background colors
" nnoremap <Leader>bg :let &background = ( &background == "dark"? "light" : "dark" )<CR> \| :hi! link FoldColumn GruvboxRed<CR> \| :hi! link Folded GruvboxYellowSign<CR>
nnoremap <Leader>bg :let &background = ( &background == "dark"? "light" : "dark" )<CR> \| :hi! link FoldColumn GruvboxRed<CR>
" }}}
" NVIM TERMINAL {{{
" Neovim terminal emulator colors, based on gruvbox
" let g:terminal_color_0 = '#665c54'
" let g:terminal_color_0 = g:COLOR_16
let g:terminal_color_1 = g:COLOR_02
let g:terminal_color_2 = g:COLOR_03
let g:terminal_color_3 = g:COLOR_04
let g:terminal_color_4 = g:COLOR_05
let g:terminal_color_5 = g:COLOR_06
let g:terminal_color_6 = g:COLOR_07
let g:terminal_color_7 = g:COLOR_08
let g:terminal_color_8 = g:COLOR_09
let g:terminal_color_9 = g:COLOR_10
let g:terminal_color_10 = g:COLOR_11
let g:terminal_color_11 = g:COLOR_12
let g:terminal_color_12 = g:COLOR_13
let g:terminal_color_13 = g:COLOR_14
let g:terminal_color_14 = g:COLOR_15
let g:terminal_color_15 = g:COLOR_16
" let g:terminal_color_16 = g:COLOR_16
" BACKGROUND_COLOR="#282828"  # Background Color
" FOREGROUND_COLOR="#ebdbb2" # Text
" }}}
" FOLDING {{{
function! MyFoldText() " {{{
    let line = getline(v:foldstart)
    let nucolwidth = &fdc + &number * &numberwidth
    " let windowwidth = winwidth(0) - nucolwidth - 12
    "
     if g:gitgutter_enabled "g:gitgutter_sign_column_always
       " exists('g:loaded_gitgutter') "&cp has('signs')
       let plop = 2
     else
       let plop = 0
     endif

    let windowwidth = winwidth(0) - nucolwidth - 12 - plop
    let foldedlinecount = v:foldend - v:foldstart

    " expand tabs into spaces
    let onetab = strpart('          ', 0, &tabstop)
    let line = substitute(line, '\t', onetab, 'g')

    let line = strpart(line, 0, windowwidth - 2 -len(foldedlinecount))
    let fillcharcount = windowwidth - len(line) - len(foldedlinecount)
    return line . ' ' . repeat(" ",fillcharcount) . '  ➜ ' . foldedlinecount . ' lines ' . '✤ ' "⤵
endfunction " }}}

set foldmethod=marker " for vim
" set foldmethod=syntax
" set foldmethod=expr
set foldtext=MyFoldText()
set foldlevel=1
set foldcolumn=2
" set foldcolumn=1
hi! link FoldColumn Statement
" hi! link FoldColumn GruvboxRed
" hi! link Folded GruvboxYellowSign
" hi! link Folded VimCommentTitle
" }}}
" IDE: AIRLINE PLUGIN STATUS AND TAB LINES {{{
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#tabline#left_sep = ' '
" let g:airline#extensions#tabline#right_sep = ' '
" let g:airline#extensions#tabline#left_alt_sep = '|'
" let g:airline#extensions#tabline#right_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_section_x = '%{&filetype}' " to no truncate filetype
let g:airline#extensions#default#section_truncate_width = {
      \ 'b': 60,
      \ 'y': 80,
      \ 'warning': 100,
      \ 'error': 100,
\ }

" let g:airline_left_sep=''
"  let g:airline_right_sep=''

" b: branch
" x: filetype
" y: encoding
" z: number line details
" let g:airline#extensions#default#section_truncate_width = {
"       \ 'b': 79,
"       \ 'x': 20,
"       \ 'y': 20,
"       \ 'z': 45,
"       \ 'warning': 100,
"       \ 'error': 100,
" \ }
" let g:airline_theme='solarized'
" let g:airline_theme='bubblegum'
" let g:airline_theme='base16'
" let g:airline_theme='jellybeans'
" let g:airline_theme='sol'
"
let g:lightline = {}
let g:lightline.colorscheme = 'yourcolorscheme'

function! MyFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction

function! MyFiletypeIcon(n)
  return winwidth(0) > 70 ? (strlen(&filetype) ?  WebDevIconsGetFileTypeSymbol() : '') : ''
endfunction

function! MyFileformat()
  return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
endfunction
function! Lightlinegit()
    let l:branch = fugitive#head()
    return l:branch ==# '' ? '' : "\uE0A0" . " " . l:branch
endfunction

" function! LightLineGitGutter()
"   if exists('*GitGutterGetHunkSummary')
"     let [ added, modified, removed ] = GitGutterGetHunkSummary()
"     return printf('+%d ~%d -%d', added, modified, removed)
"   endif
"   return ''
" endfunction

function! Sy_stats_wrapper()
  let symbols = ['+', '-', '~']
  let [added, modified, removed] = sy#repo#get_stats()
  let stats = [added, removed, modified]  " reorder
  let hunkline = ''

  for i in range(3)
    if stats[i] > 0
      let hunkline .= printf('%s%s ', symbols[i], stats[i])
    endif
  endfor

  if !empty(hunkline)
    let hunkline = printf(' [%s]', hunkline[:-2])
  endif

  return hunkline
endfunction

let g:lightline.component = {
      \ 'empty': '',
      \ 'filepath': '%F'}
let g:lightline.component_function = {
      \ 'gitbranch': 'Lightlinegit',
      \ 'gitstatus': 'Sy_stats_wrapper',
      \ 'filetype': 'MyFiletype',
      \ 'fileformat': 'MyFileformat',
      \ }
      " \ 'gitbranch': 'Lightlinegit',
      " \ 'gitbranch': 'fugitive#statusline',
      " \ 'gitbranch': '%{fugitive#statusline()}',


let g:lightline.tab_component_function = {
      \ 'filetypeicon': 'MyFiletypeIcon',
      \ }
let g:lightline.active = {
      \ 'left': [ [ 'mode', 'paste' ], ['gitbranch', 'gitstatus'],
      \           [ 'readonly', 'filename', 'modified' ] ],
      \ 'right': [ [ 'percent' , 'lineinfo' ],
      \            [ 'fileencoding'],
      \           [ 'filetype'] ] }
let g:lightline.inactive = {
      \ 'left': [ [ 'filepath' ] ],
      \ 'right': [ ['empty'] ] }
let g:lightline.tabline = {
      \ 'left': [ [ 'tabs' ] ],
      \ 'right': [ [ 'close' ] ] }
let g:lightline.tab = {
      \ 'active': [ 'tabnum', 'filename', 'filetypeicon', 'modified' ],
      \ 'inactive': [ 'tabnum', 'filename', 'modified' ]
      \ }
let g:lightline.separator = { 'left': "\ue0b0", 'right': '' }
let g:lightline.subseparator = { 'left': '|', 'right': '' }

let s:fg_focus = [ '#ffffff' , "NONE" ]
let s:bg_focus = ["#665C54", "NONE"]
let s:fg_hard = [ '#dfdbd2', "NONE"]
let s:bg_hard = [ '#332927' , "NONE" ]
let s:fg_soft = [ '#dfdbd2', "NONE"]
let s:bg_soft = [ '#3c3836', "NONE"]
let s:bg_visual = [ '#d08770' , "NONE" ]
let s:bg_insert = [ '#BF616A' , "NONE" ]
let s:fg_inactive = [ '#a89984' , "NONE" ]
let s:none = [ 'NONE' , 'NONE' ]

if g:colors_name == 'gruvbox'
  let s:fg_focus = [ '#282828' , "NONE" ]
  let s:bg_focus = ["#a89984", "NONE"]
  let s:fg_hard = [ '#a89984', "NONE"]
  let s:bg_hard = [ '#504945' , "NONE" ]
  let s:fg_soft = [ '#a89984', "NONE"]
  let s:bg_soft = [ '#3c3836', "NONE"]
  let s:bg_visual = [ '#f79375' , "NONE" ]
  let s:bg_insert = [ '#dfdbd2' , "NONE" ]
  let s:fg_inactive = [ '#a89984' , "NONE" ]
  let s:none = [ 'NONE' , 'NONE' ]
endif

if g:colors_name == 'nord'
  let s:fg_focus = [ '#eCEFF4' , "NONE" ]
  let s:bg_focus = ["#5E81AC", "NONE"]
  let s:fg_hard = [ '#d8DEE9', "NONE"]
  let s:bg_hard = [ '#4C566A' , "NONE" ]
  let s:fg_soft = [ '#d8DEE9', "NONE"]
  let s:bg_soft = [ '#3B4252', "NONE"]
  let s:bg_insert = [ '#BF616A' , "NONE" ]
  let s:bg_visual = [ '#d08770' , "NONE" ]
  let s:fg_inactive = [ '#5E81AC' , "NONE" ]
  let s:none = [ 'NONE' , 'NONE' ]
endif

if g:colors_name == 'material-theme'
  let s:fg_focus = [ '#ffffff' , "NONE" ]
  let s:bg_focus = ["#5C7E8C", "NONE"]
  let s:fg_hard = [ '#cDD3DE', "NONE"]
  let s:bg_hard = [ '#4C566A' , "NONE" ]
  let s:fg_soft = [ '#cDD3DE', "NONE"]
  let s:bg_soft = [ '#37474F', "NONE"]
  let s:bg_insert = [ '#BF616A' , "NONE" ]
  let s:bg_visual = [ '#d08770' , "NONE" ]
  let s:fg_inactive = [ '#7986CB' , "NONE" ]
  let s:none = [ 'NONE' , 'NONE' ]
endif


if g:colors_name == 'deus'
  let s:fg_focus = [ '#ebdbb2' , "NONE" ]
  let s:bg_focus = ["#665c54", "NONE"]
  let s:fg_hard = [ '#ebdbb2', "NONE"]
  let s:bg_hard = [ '#3A3B3F' , "NONE" ]
  let s:fg_soft = [ '#ebdbb2', "NONE"]
  let s:bg_soft = [ '#292f37', "NONE"]
  let s:bg_insert = [ '#BF616A' , "NONE" ]
  let s:bg_visual = [ '#d08770' , "NONE" ]
  let s:fg_inactive = [ '#928374' , "NONE" ]
  let s:none = [ 'NONE' , 'NONE' ]
endif

if g:colors_name == 'one'
  let s:fg_focus = [ '#abb2bf' , "NONE" ]
  let s:bg_focus = ["#4b5263", "NONE"]
  let s:fg_hard = [ '#abb2bf', "NONE"]
  let s:bg_hard = [ '#3b4048' , "NONE" ]
  let s:fg_soft = [ '#abb2bf', "NONE"]
  let s:bg_soft = [ '#2c323c', "NONE"]
  let s:bg_insert = [ '#5E81AC' , "NONE" ]
  let s:bg_visual = [ '#528bff' , "NONE" ]
  let s:fg_inactive = [ '#5c6370' , "NONE" ]
  let s:none = [ 'NONE' , 'NONE' ]
endif

if g:colors_name == 'dracula'
  let s:fg_focus = [ '#f8f8f2' , "NONE" ]
  let s:bg_focus = ["#6272a4 ", "NONE"]
  let s:fg_hard = [ '#f8f8f2', "NONE"]
  let s:bg_hard = [ '#3b4048' , "NONE" ]
  let s:fg_soft = [ '#abb2bf', "NONE"]
  let s:bg_soft = [ '#333333', "NONE"]
  let s:bg_insert = [ '#bd93f9' , "NONE" ]
  let s:bg_visual = [ '#ff79c6' , "NONE" ]
  let s:fg_inactive = [ '#5c6370' , "NONE" ]
  let s:none = [ 'NONE' , 'NONE' ]
endif

if g:colors_name == 'neodark'
  let s:fg_focus    = [ '#1F2F38' , "NONE" ]
  let s:bg_focus    = [ "#AABBC4" , "NONE" ]
  let s:fg_hard     = [ '#AABBC4' , "NONE" ]
  let s:bg_hard     = [ '#475C69' , "NONE" ]
  let s:fg_soft     = [ '#AABBC4' , "NONE" ]
  let s:bg_soft     = [ '#263A45' , "NONE" ]
  let s:bg_insert   = [ '#B888E2' , "NONE" ]
  let s:bg_visual   = [ '#E69CA0' , "NONE" ]
  let s:fg_inactive = [ '#658595' , "NONE" ]
  let s:none        = [ 'NONE'    , 'NONE' ]
endif

if g:colors_name == 'space-vim-dark'
  let s:fg_focus    = [ '#292b2e' , "NONE" ]
  let s:bg_focus    = [ '#d4b261' , "NONE" ]
  let s:fg_hard     = [ '#b2b2b2' , "NONE" ]
  let s:bg_hard     = [ '#3B414E' , "NONE" ]
  let s:fg_soft     = [ '#999999' , "NONE" ]
  let s:bg_soft     = [ '#34323e' , "NONE" ]
  let s:bg_insert   = [ '#b4d1b6' , "NONE" ]
  let s:bg_visual   = [ '#FF73B9' , "NONE" ]
  let s:fg_inactive = [ '#2aa1ae' , "NONE" ]
  let s:none        = [ 'NONE'    , 'NONE' ]
endif

if g:colors_name == 'challenger_deep'
  let s:fg_focus    = [ '#f3f3f3' , "NONE" ]
  let s:bg_focus    = [ '#767676' , "NONE" ]
  let s:fg_hard     = [ '#b2b2b2' , "NONE" ]
  let s:bg_hard     = [ '#2C2A3A' , "NONE" ]
  let s:fg_soft     = [ '#999999' , "NONE" ]
  let s:bg_soft     = [ '#100e23' , "NONE" ]
  let s:bg_insert   = [ '#c991e1' , "NONE" ]
  let s:bg_visual   = [ '#62d196' , "NONE" ]
  let s:fg_inactive = [ '#767676' , "NONE" ]
  let s:none        = [ 'NONE'    , 'NONE' ]
endif




let s:p = {'normal': {}, 'tabline': {}, 'insert':{}, 'visual':{}, 'inactive':{}}
let s:p.normal.left = [
      \ [ s:fg_focus, s:bg_focus, 'bold' ],
      \ [ s:fg_hard, s:bg_hard ],
      \]
let s:p.normal.middle = [
      \ [ s:fg_soft, s:bg_soft ] ]
let s:p.normal.right = [
      \ [ s:fg_focus, s:bg_focus, 'bold' ],
      \ [ s:fg_hard, s:bg_hard ],
      \ [ s:fg_soft, s:bg_soft ] ]
let s:p.tabline.left = [ [ s:fg_hard, s:bg_hard ] ]
let s:p.tabline.tabsel = [ [ s:fg_focus, s:bg_focus ] ]
let s:p.tabline.middle = [ [ s:fg_soft, s:bg_soft ] ]
let s:p.insert.left = [
      \ [ s:fg_focus, s:bg_insert, 'bold' ],
      \ [ s:fg_hard, s:bg_hard ]
      \ ]
let s:p.insert.right = [
      \ [ s:fg_focus, s:bg_insert, 'bold' ],
      \ [ s:fg_hard, s:bg_hard ]
      \ ]
let s:p.visual.left = [
      \ [ s:fg_focus, s:bg_visual, 'bold' ],
      \ [ s:fg_hard, s:bg_hard ]
      \ ]
let s:p.visual.right = [
      \ [ s:fg_focus, s:bg_visual, 'bold' ],
      \ [ s:fg_hard, s:bg_hard ]
      \ ]
let s:p.inactive.left = [ [ s:fg_inactive, s:bg_soft, 'italic' ], [ s:fg_inactive, s:bg_soft ] ]
let s:p.inactive.right = [ [ s:fg_inactive, s:bg_soft], [ s:fg_inactive, s:bg_soft ] ]
let s:p.inactive.middle = [ [ s:fg_inactive, s:bg_soft ] ]

let g:lightline#colorscheme#yourcolorscheme#palette = lightline#colorscheme#flatten(s:p)

" }}}
" IDE: TMUXLINE {{{

" Tmuxline does not work automatically without airline.
" let g:airline#extensions#tmuxline#enabled = 0
" Preset can be configure with:
" let g:tmuxline_powerline_separators = 0
let g:tmuxline_separators = {
    \ 'left' : '',
    \ 'left_alt': '',
    \ 'right' : '',
    \ 'right_alt' : '',
    \ 'space' : ' '}
let g:tmuxline_preset = {
      \'a'    : '#S',
      \'win'  : ['#I:#W'],
      \'cwin' : ['#I:#W ✔'],
      \'x'    : '',
      \'y'    : '',
      \'z'    : ['\uF080' . ' '],
      \'options' : {'status-justify' : 'left'}}
      " \'y'    : ['%Y-%m-%d'],
      " \'z'    : ['$USER' . '\uF080' . ' '],
let g:tmuxline_theme = {
      \'a'    : [ s:fg_focus[0], s:bg_focus[0], 'bold'],
      \'b'    : [ s:fg_soft[0], s:bg_soft[0] ],
      \'bg'   : [ s:fg_soft[0], s:bg_soft[0] ],
      \'c'    : [ s:fg_soft[0], s:bg_soft[0] ],
      \'win'  : [ s:fg_soft[0], s:bg_soft[0] ],
      \'cwin' : [ s:fg_hard[0], s:bg_hard[0] ],
      \'x'   : [ s:fg_soft[0], s:bg_soft[0] ],
      \'y'   : [ s:fg_hard[0], s:bg_hard[0] ],
      \'z'    : [ s:fg_focus[0], s:bg_focus[0], 'bold'] }
"  It can be activated with:
if exists('$TMUX')
    autocmd VimEnter * call tmuxline#set_statusline()
endif
" }}}
" IDE: NERDTREE PLUGIN {{{
" :nmap \n :NERDTreeToggle<CR>
set splitright
map <leader>n :NERDTreeToggle<CR>
let NERDTreeMapOpenInTab='T'
let NERDTreeMapOpenInTabSilent='t'
" hi def link NERDTreeOpenable Directory
" }}}
" IDE: DEOPLETE PLUGIN {{{
let g:deoplete#enable_at_startup = 1
" let g:deoplete#complete_method = "omnifunc"
" let g:deoplete#sources = {}
" let g:deoplete#sources._ = ['buffer', 'member', 'tag', 'file', 'omni', 'dictionary', 'around']
" }}}
" IDE: ULTISNIPPETS PLUGIN {{{
" If you want :UltiSnipsEdit to split your window.
" let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsEditSplit="context"
" let g:UltiSnipsSnippetsDir=$HOME.'/Documents/Nvim/UltiSnips' " where to create my snippets
let g:UltiSnipsSnippetsDir=$HOME.'/Documents/Repositories/dotfiles-ubuntu-18/UltiSnips' " where to create my snippets
let g:UltiSnipsSnippetDirectories=["UltiSnips", $HOME.'/Documents/Repositories/dotfiles-ubuntu-18/UltiSnips'] " It is necessary to define defaults snippets and your directory
" Add markdown snippets to vimwiki buffer
" inoremap <silent><buffer> <expr><Right> pumvisible() ? deoplete#close_popup() : "<CR>"
let g:UltiSnipsExpandTrigger="nop"
function! s:expand_snippet_or_key(key) abort
  let g:ulti_expand_or_jump_res = 0
  let snippet = UltiSnips#ExpandSnippetOrJump()
  " return snippet
  return (g:ulti_expand_or_jump_res > 0) ? snippet : a:key
endfunction
inoremap <silent> <expr> <CR> pumvisible() ? "<C-y><C-R>=UltiSnips#ExpandSnippet()<CR>" : "\<CR>"
inoremap <silent> <expr> <TAB> pumvisible() ? "\<C-n>" : "<C-R>=<SID>expand_snippet_or_key(\"\t\")<CR>"

" inoremap <silent><expr> <TAB>
" 		\ pumvisible() ? "\<C-n>" :
" 		\ <SID>check_back_space() ? "\<TAB>" :
" 		\ deoplete#mappings#manual_complete()
" 		function! s:check_back_space() abort "{{{
" 		let col = col('.') - 1
" 		return !col || getline('.')[col - 1]  =~ '\s'
" endfunction"}}}
au FileType vimwiki :UltiSnipsAddFiletypes markdown
au FileType vimwiki set syntax=pandoc
" }}}
" IDE: SLIMUX PLUGIN {{{
" nmap <C-c><C-c> :SlimuxREPLSendBuffer<CR>
" nmap <C-j> V:SlimuxREPLSendLine<CR>j
" vmap <C-j> :SlimuxREPLSendLine<CR>
" cmap <C-j> SlimuxREPLSendLine<cr> " console
" vmap <C-s> :SlimuxREPLSendSelection<CR>
" " map <C-c>r :exe "SlimuxShellRun source('" . expand("%:p") . "')"<CR>
" " map \fn <C-R>=expand("%:t:r")<CR>
" " '+ exe ":normal i" . expand("%:t")'
" " map <C-c>r :SlimuxShellRun ls() . expand("%:h")<CR>
" " doeswork = expand("%:h") . ".bak"
" "
" " }}}
" IDE: TAGS {{{
" tags
let g:tagbar_type_r = {
    \ 'ctagstype' : 'r',
    \ 'kinds'     : [
        \ 'f:Functions',
        \ 'g:GlobalVariables',
        \ 'v:FunctionVariables',
    \ ]
\ }
" }}}
" IDE: VIMCMDLINE {{{
let cmdline_app           = {}
let cmdline_app["python"] = "ipython"
let cmdline_in_buffer          = 0      " Start the interpreter in a Neovim buffer
" let cmdline_external_term_cmd = "gnome-terminal -e '%s'"
" let cmdline_external_term_cmd = "xterm -e '%s' &"
" }}}
" IDE: LANGUAGE SERVER PROTOCOL {{{
set hidden
"     " \ 'r': ['R', '--quiet', '--slave', '-e', 'languageserver::run()'],
"     " \ 'rust': ['rustup', 'run', 'nightly', 'rls'],
let g:LanguageClient_serverCommands = {
    \ 'rust': ['rustup', 'run', 'stable', 'rls'],
    \ 'javascript': ['javascript-typescript-stdio'],
    \ 'javascript.jsx': ['javascript-typescript-stdio'],
    \ 'cpp': ['clangd'],
    \ 'python': ['pyls'],
    \ 'r': ['R', '--quiet', '--slave', '-e', 'languageserver::run()'],
    \ 'rmd': ['R', '--quiet', '--slave', '-e', 'languageserver::run()'],
    \ }
let g:LanguageClient_autoStart = 1
" let g:LanguageClient_trace = 'verbose'
" nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>
" nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
" nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()<CR>
" let g:LanguageClient_loggingLevel = 'DEBUG'
" " }}}
" VISUAL: DEVICONS {{{
" vim-devisons
set guifont=Droid\ Sans\ Mono\ for\ Powerline\ Nerd\ Font\ Complete\ 16
" set guifont=Droid\ Sans\ Mono\ for\ Powerline\ Nerd\ Font\ Complete\ 14
" set guifont=Ubuntu\ Mono \derivative\ Powerline\ 16
" set guifont=Droid\ Sans\ Mono\ for\ Powerline\ Plus\ Nerd\ File\ Types\ 11
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols = {} " needed
" let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['r'] = '★'
" let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['r'] = 'Ⓡ'
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['r'] = 'ℝ'
" let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['r'] = '☯'
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['stan'] = 'Ⓢ'
" let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['r'] = '★ ♨ ☢ '
" let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['r'] = ''
" }}}
" VISUAL: INDENTLINE PLUGIN {{{
" indentline to exclude tex files
let g:indentLine_fileTypeExclude = ['tex', 'markdown', 'pandoc']
" }}}
" VISUAL: NEOVIM ADDITIONAL OPTIONS {{{

" Change the vertical split appareance
" hi LineNr guibg=bg
" set foldcolumn=2
" hi foldcolumn guibg=bg
" hi VertSplit guibg=bg3 guifg=bg3
set fillchars+=vert:\│
" hi clear VertSplit
" hi! link VertSplit Comment
" hi VertSplit guibg=NONE
" hi VertSplit guibg=NONE guifg=black
hi VertSplit guibg=NONE guifg=#1d2021 gui=none
" hi VertSplit	guibg=black guifg=grey50 gui=none
" hi VertSplit guibg=NONE guifg=['#1d2021', 234]
" let g:gruvbox_vert_split='faded_red'
" hi VertSplit guibg=none
" hi VertSplit guifg=none
" hi! link VertSplit GruvboxPurpleSign
" guifg=GruvboxPurple guibg=GruvboxPurple
"


" }}}
" EXPLORE: CONTROL-P PLUGIN {{{
" let g:ctrlp_map = '<c-p>'
" let g:ctrlp_cmd = 'CtrlP'
" let g:ctrlp_working_path_mode = 'ra'
" }}}
" EXPLORE: NERDTREE {{{
" NERDTress File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg)
exec 'autocmd FileType nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guifg='. a:guifg
exec 'autocmd FileType nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

" call NERDTreeHighlightFile('R', 'none', 'none', '#fb4934')
" call NERDTreeHighlightFile('rmd', 'blue', 'none', '#458588', '#458588')
" call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
" call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
" " call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
" call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
" call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
" call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
" call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
" call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
" call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
" call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
" call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
" call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
" call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')
" call NERDTreeHighlightFile('ds_store', 'Gray', 'none', '#686868', '#151515')
" call NERDTreeHighlightFile('gitconfig', 'Gray', 'none', '#686868', '#151515')
" call NERDTreeHighlightFile('gitignore', 'Gray', 'none', '#686868', '#151515')
" call NERDTreeHighlightFile('bashrc', 'Gray', 'none', '#686868', '#151515')
" call NERDTreeHighlightFile('bashprofile', 'Gray', 'none', '#686868', '#151515')
" }}}
" PROGRAMS: R {{{
" let r_syntax_folding = 1 " need improves foolding
" to highlight r code in rmd
" let rrst_syn_hl_chunk = 1
let rmd_syn_hl_chunk = 1 " to highlight the fisrt line
let g:rmd_syn_langs = ["r", "python", "c"]
" It is only required if vim-pandoc is not installed
" augroup pandoc_syntax
"       au! BufNewFile,BufFilePre,BufRead *.md set filetype=markdown.pandoc
" augroup END
" augroup pandoc_syntax
"       au! BufNewFile,BufFilePre,BufRead *.pmd set filetype=markdown.pandoc
" augroup END
let g:pandoc#syntax#codeblocks#embeds#langs = ["cpp", "r", "bash=sh", "python"]
" let g:pandoc#folding#fold_fenced_codeblocks = 1
" let g:pandoc#folding#fdc = 0
let g:pandoc#syntax#conceal#urls = 1
" let g:pandoc#syntax#style#underline_special = 0
let g:pandoc#syntax#conceal#use = 1 " pretty highlight
" autocmd FileType * setlocal conceallevel=0
" let g:pandoc#keyboard#blacklist_submodule_mappings =  ["lists", "references", "styles", "sections", "links"]
" let g:pandoc#keyboard#blacklist_submodule_mappings =  ["references"]

let g:pandoc#hypertext#use_default_mappings=0
" let g:pandoc#filetypes#pandoc_markdown=0
let g:pandoc#modules#disabled = ["folding"]

" let hostname = substitute(system('hostname'), '\n', '', '')
" if hostname == "chaconmo-ThinkPad-L470-W10DG"
  " let R_in_buffer = 0 " 0 to not open in an nvim external terminal emulator
" elseif hostname == "chaconmo-Precision-5510"
  " if exists("g:gui_oni")
  "   let R_in_buffer = 1 " 0 to not open in an nvim external terminal emulator
  " else
  "   let R_in_buffer = 0 " 0 to not open in an nvim external terminal emulator
  " endif
  " Open R in a tmux split
  let R_source = '~/.local/share/nvim/plugged/Nvim-R/R/tmux_split.vim'
  " let R_applescript = 0
  " let R_tmux_split = 1
" endif

" Open R in an external tmux terminal
" let R_in_buffer = 0 " 0 to not open in an nvim external terminal emulator
" Other tmux options
let R_tmux_title = "automatic" " tmux window names
let R_objbr_place = "script,right"
" Shortcuts
let R_assign = 0
" Splits distribution
" let R_editor_w = 30
" let R_rconsole_width = 86
let R_rconsole_height = 10
" let R_rconsole_width = 0
" Functions arguments
" let R_show_args = 1 " show arguments in a new pane after omnicompletion
" let R_show_arg_help = 1 " show arguments help after completion
let R_args_in_stline = 1 " show arguments on the status line
" Markdown options
let R_openhtml = 1
let R_pdfviewer = "evince"
" Highlighting
" let R_start_libs = "base,stats,graphics,grDevices,utils,methods"
" let R_hi_fun = 0 " 0 to not Highlight functions, problem with ROnJobStdout
let R_hi_fun_paren = 1 " only highlight if ( is typed
" }}}
" PROGRAMS: LATEX {{{
let g:airline#extensions#vimtex#enabled = 0 " unable extension because is failing
" Recoganize tex as latex
let g:tex_flavor = 'tex'
" let g:vimtex_toc_number_width = -1
let g:vimtex_toc_secnumdepth=0
" let g:vimtex_index_resize=1
let g:vimtex_index_split_width=40
let g:vimtex_index_split_pos = "vertical botright"
" Latex shortcuts
" nnoremap <localleader>lt :VimtexTocOpen<CR>
nnoremap <localleader>lt :VimtexTocToggle<CR>
nnoremap <localleader>lv :VimtexView<CR>
nnoremap <localleader>ll :VimtexCompile<CR>
nnoremap <localleader>lo :VimtexCompileSS<CR>
nnoremap <localleader>le :VimtexErrors<CR>
nnoremap <localleader>lc :VimtexClean<CR>
let g:tex_conceal="abdmg"
" let g:tex_conceal=""
" let g:tex_fast= "bcmprsSvV"
" let g:tex_fast= "b"
" let g:vimtex_complete_recursive_bib = 1
" Partial solution to fix_paths
let g:vimtex_quickfix_latexlog = {'fix_paths' : 0}
let vimtex_fold_enabled = 1
" work with okular
" let g:vimtex_view_general_viewer = 'okular'
let g:vimtex_view_enabled = 0
let g:vimtex_view_general_options = '--unique file:@pdf\#src:@line@tex'
let g:vimtex_view_general_options_latexmk = '--unique'
" }}}
" PROGRAMS: VIMWIKI {{{
" Vimkiwi setup
let g:vimwiki_list = [{'path':'$HOME/Documents/Nvim/Vimwiki',
                     \ 'syntax': 'markdown', 'ext': '.wiki'}]
                     " \ 'syntax': 'markdown', 'ext': '.wiki'}]
                     " \ {'path':'$HOME/Documents/Repositories/MyWebPage/_drafts',
                     " \ 'syntax': 'markdown', 'ext': '.md'}]
let g:vimwiki_table_mappings = 0
let $blogdir = '/home/chaconmo/Documents/Repositories/erickchacon/'
" let g:vimwiki_folding='list' # not very well implemented
" let g:vimwiki_folding='expr'
" let g:vimwiki_global_ext = 0 " do not override markdown outside vimwiki folder.
" let g:vimwiki_char_bold = '**'
" let g:vimwiki_char_italic = '_'
" inoremap <F13> <Esc>:VimwikiReturn 1 5<CR>
" nmap <Leader>w <Plug>VimwikiIndex
" nmap <Leader>wf <Plug>VimwikiFollowLink
" nmap <Leader>wn <Plug>VimwikiNextLink
" imap <Leader>wn <Plug>vimwiki_i_<CR>
" nmap <Leader>eq <plug>(vimtex-a$)
" inoremap <Leader> <CR> <C-r>=<SID>my_cr_function()<CR>
" function! s:my_cr_function() abort
"   return deoplete#close_popup() . "\<CR>"
" endfunction
" map <buffer> <C-G> :s/^/\/\//<Esc><Esc>

" Spelling
" set spell spelllang=en_us
" set spell
hi! link VimwikiHeader1 WarningMsg
hi! link VimwikiHeader2 PreProc
hi! link VimwikiHeader3 Boolean
hi! link VimwikiHeader4 Type
hi! link VimwikiHeader5 Identifier
hi! link VimwikiHeader6 String
" hi! link pandocSetexHeader WarningMsg
" hi! link Title WarningMsg
" hi! link Title Define
" hi Title gui=bold

" hi! link VimwikiHeader1 GruvboxRedBold
" hi! link VimwikiHeader2 GruvboxAquaBold
" hi! link VimwikiHeader3 GruvboxPurpleBold
" hi! link VimwikiHeader4 GruvboxYellowBold
" hi! link VimwikiHeader5 GruvboxBlueBold
" hi! link VimwikiHeader6 GruvboxGreenBold
" }}}
" PROGRAMS: MARKDOWN {{{
au BufNewFile,BufRead *.Rmarkdown set filetype=rmd
" let g:markdown_composer_browser = "firefox"
let g:markdown_composer_autostart = 0

" markdown plasticboy
let g:vim_markdown_math = 1
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_new_list_item_indent = 2
" }}}
" PROGRAMS: HTML {{{
" html yaml syntax highlighting
" autocmd BufNewFile,BufRead *.html syntax match Comment /\%^---\_.\{-}---$/
" }}}
" PROGRAMS: CPP {{{
let g:cpp_class_scope_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_concepts_highlight = 1
let g:cpp_experimental_simple_template_highlight = 1
let g:cpp_experimental_template_highlight = 1
let g:cpp_concepts_highlight = 1
let c_no_curly_error=1
" }}}
" PROGRAMS: PYTHON {{{
let python_highlight_all = 1
" }}}
" PROGRAMS: JULIA {{{
let g:default_julia_version = "current"
" }}}
" PROGRAMS: SPOTITY {{{

" let g:spotify_token='NWU0MDJhNDg2Yjk4NDUzODkxNjY2Y2NlMDFkYjE3Y2U6ZDc5OTc5OGYwODg5NDFjMzk3MzQ5OTgwNmQwMDZmNTY='
