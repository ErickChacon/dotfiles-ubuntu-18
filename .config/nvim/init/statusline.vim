
" Lightline type: 1, 2 or 3 {{{
if g:colors_name == 'crunchbang' || g:colors_name == 'onehalfdark' ||
      \ g:colors_name == 'base16-flat' || g:colors_name == 'base16-phd'
  let s:lightline_type = 3
elseif g:colors_name == 'monokai' || g:colors_name == 'material-theme' ||
      \ g:colors_name == 'dracula' || g:colors_name == 'deus' ||
      \ g:colors_name == 'base16-default-dark' || g:colors_name == 'challenger_deep'
  let s:lightline_type = 2
else
  let s:lightline_type = 1
endif
" }}}
" Lightline default colors: soft, visual, insert, inactive {{{
let g:fg_soft     = [ tolower(synIDattr(synIDtrans(hlID('Normal')), 'fg', 'gui')), "NONE" ]
let g:bg_soft     = [ tolower(synIDattr(synIDtrans(hlID('CursorLine')), 'bg', 'gui')), "NONE"]
let s:bg_visual   = [ tolower(synIDattr(synIDtrans(hlID('Identifier')), 'fg', 'gui')), "NONE"]
let s:bg_insert   = [ tolower(synIDattr(synIDtrans(hlID('Define')), 'fg', 'gui')), "NONE"]
let s:fg_inactive = [ tolower(synIDattr(synIDtrans(hlID('LineNr')), 'fg', 'gui')), "NONE"]
" }}}
" Lightline default colors: focus, hard {{{
if s:lightline_type == 1     " bg: normal fg - linenr fg - cursorline bg
  let g:fg_focus = [ tolower(synIDattr(synIDtrans(hlID('Normal')), 'bg', 'gui')), "NONE" ]
  let g:bg_focus = [ tolower(synIDattr(synIDtrans(hlID('Normal')), 'fg', 'gui')), "NONE" ]
  let g:fg_hard  = [ tolower(synIDattr(synIDtrans(hlID('Normal')), 'fg', 'gui')), "NONE" ]
  let g:bg_hard  = [ tolower(synIDattr(synIDtrans(hlID('LineNr')), 'fg', 'gui')), "NONE"]
elseif s:lightline_type == 2 " bg: linenr fg - normal fg - cursorline bg
  let g:fg_focus = [ tolower(synIDattr(synIDtrans(hlID('Normal')), 'fg', 'gui')), "NONE" ]
  let g:bg_focus = [ tolower(synIDattr(synIDtrans(hlID('LineNr')), 'fg', 'gui')), "NONE"]
  let g:fg_hard  = [ tolower(synIDattr(synIDtrans(hlID('Normal')), 'fg', 'gui')), "NONE" ]
  let g:bg_hard  = [ tolower(synIDattr(synIDtrans(hlID('Normal')), 'bg', 'gui')), "NONE" ]
elseif s:lightline_type == 3 " bg: linenr fg - normal fg - cursorline bg
  let g:fg_focus = [ tolower(synIDattr(synIDtrans(hlID('Normal')), 'bg', 'gui')), "NONE" ]
  let g:bg_focus = [ tolower(synIDattr(synIDtrans(hlID('LineNr')), 'fg', 'gui')), "NONE"]
  let g:fg_hard  = [ tolower(synIDattr(synIDtrans(hlID('Normal')), 'fg', 'gui')), "NONE" ]
  let g:bg_hard  = [ tolower(synIDattr(synIDtrans(hlID('Normal')), 'bg', 'gui')), "NONE" ]
endif
" }}}
" Lightline custom colors per palette {{{
if g:colors_name      == 'gruvbox'
  let g:bg_focus      = [ '#a89984', 'NONE' ]
  let g:fg_hard       = [ '#a89984', 'NONE' ]
  let g:bg_hard       = [ '#504945', 'NONE' ]
  let g:fg_soft       = [ '#a89984', 'NONE' ]
elseif g:colors_name  == 'nord'
  let g:fg_focus      = [ '#eCEFF4', 'NONE' ]
  let g:bg_focus      = [ '#5E81AC', 'NONE' ]
  let s:bg_insert     = [ '#BF616A', 'NONE' ]
  let s:bg_visual     = [ '#d08770', 'NONE' ]
  let s:fg_inactive   = [ '#79808F', 'NONE' ]
elseif g:colors_name  == 'material-theme'
  let g:fg_hard       = [ '#cDD3DE', 'NONE' ]
  let g:bg_hard       = [ '#4C566A', 'NONE' ]
  let g:fg_soft       = [ '#cDD3DE', 'NONE' ]
elseif g:colors_name  == 'dracula'
  let g:fg_hard       = [ '#abb2bf', 'NONE' ]
  let g:bg_hard       = [ '#333333', 'NONE' ]
  let g:fg_soft       = [ '#abb2bf', 'NONE' ]
  let s:bg_insert     = [ '#bd93f9', 'NONE' ]
  let s:bg_visual     = [ '#ff79c6', 'NONE' ]
elseif g:colors_name  == 'space-vim-dark'
  let g:fg_focus      = [ '#292b2e', 'NONE' ]
  let g:bg_focus      = [ '#d4b261', 'NONE' ]
  let s:bg_insert     = [ '#b4d1b6', 'NONE' ]
  let s:bg_visual     = [ '#FF73B9', 'NONE' ]
  let s:fg_inactive   = [ '#2aa1ae', 'NONE' ]
elseif g:colors_name  == 'deus'
  let g:bg_hard       = [ '#3A3B3F', 'NONE' ]
elseif g:colors_name  == 'challenger_deep'
  let g:bg_hard       = [ '#2A2942', 'NONE' ]
  let s:bg_insert     = [ '#65b2ff', 'NONE' ]
elseif g:colors_name  == 'monokai'
  let g:bg_hard       = [ '#5C5C53', 'NONE' ]
elseif g:colors_name  == 'NeoSolarized'
  let g:bg_hard       = [ '#30555E', 'NONE' ]
elseif g:colors_name  == 'OceanicNext'
  let g:bg_hard       = [ '#575F68', "NONE" ]
elseif g:colors_name  == 'neodark'
  let g:bg_hard       = [ '#4D4D4D', "NONE" ]
elseif g:colors_name  == 'tender'
  let g:bg_focus      = [ '#b3deef', 'NONE' ]
  let s:bg_visual     = [ '#eeeeee', 'NONE' ]
  let s:fg_inactive   = [ '#767676', 'NONE' ]
elseif g:colors_name  == 'synthwave'
  let g:fg_focus      = [ '#bfb8cc', 'NONE' ]
  let g:bg_focus      = [ '#736075', 'NONE' ]
elseif g:colors_name  == 'alduin'
  let g:bg_focus      = [ '#87875f', 'NONE' ]
elseif g:colors_name  == 'deep-space'
  let s:fg_inactive   = [ '#47505F', 'NONE' ]
elseif g:colors_name  == 'base16-atlas'
  let g:bg_hard       = [ '#2B5968', 'NONE' ]
endif
" }}}

" Statusline {{{1


function Gitbranch()
    let l:branch = fugitive#head()
    return l:branch ==# '' ? '' : "\uE0A0" . " " . l:branch
endfunction

function Gitstats()
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


let g:currentmode={
    \ 'n'  : 'Normal',
    \ 'v'  : 'Visual',
    \ 'V'  : 'V·Line',
    \ "\<C-V>" : 'V·Block',
    \ 's'  : 'Select',
    \ 'S'  : 'S·Line',
    \ '^S' : 'S·Block',
    \ 'i'  : 'Insert',
    \ 'R'  : 'Replace',
    \ 'Rv' : 'V·Replace',
    \ 'c'  : 'Command',
    \ 'cv' : 'Vim Ex',
    \ 'ce' : 'Ex',
    \ 'r'  : 'Prompt',
    \ 'rm' : 'More',
    \ 'r?' : 'Confirm',
    \ '!'  : 'Shell',
    \ 't'  : 'Terminal'
    \}

execute 'hi stl_focus guifg=' . g:fg_focus[0] . ' guibg=' . g:bg_focus[0] . ' gui=bold'
execute 'hi stl_focus_alt guifg=' . g:bg_focus[0] . ' guibg=' . g:bg_hard[0] . ' gui=bold'
execute 'hi stl_focus_alt2 guifg=' . g:bg_focus[0] . ' guibg=' . g:bg_soft[0] . ' gui=bold'
execute 'hi stl_hard guifg=' . g:fg_hard[0] . ' guibg=' . g:bg_hard[0]
execute 'hi stl_hard_alt guifg=' . g:bg_hard[0] . ' guibg=' . g:bg_soft[0]
execute 'hi stl_soft guifg=' . g:fg_soft[0] . ' guibg=' . g:bg_soft[0]
execute 'hi! TabLineSel guifg=' . g:fg_focus[0] . ' guibg=' . g:bg_focus[0]
execute 'hi! Tabline guifg=' . g:fg_hard[0] . ' guibg=' . g:bg_hard[0] . ' gui=NONE'
execute 'hi TabLineFill guifg=' . g:fg_soft[0] . ' guibg=' . g:bg_soft[0]

let g:status_active = "%#stl_focus#\ %{toupper(g:currentmode[mode()])}\ "
let g:status_active .= "%#stl_focus_alt#⮀"
" let g:status_active .= "%#stl_hard#\ %{Gitbranch()}\ "
" let g:status_active .= "%#stl_hard#\ %{Gitstats()}\ "
let g:status_active .= "%#stl_hard_alt#⮀"
let g:status_active .= "%#stl_soft#"
let g:status_active .= "\ %0.30f\ %m%r"
let g:status_active .= "%="
let g:status_active .= "%{&filetype}\ "
let g:status_active .= "%#stl_hard_alt#⮂"
let g:status_active .= "%#stl_hard#\ %{&fileencoding?&fileencoding:&encoding}\ "
let g:status_active .= "%#stl_focus_alt#⮂"
let g:status_active .= "%#stl_focus#\ %3p%%\ %3l:%2c\ "

let g:status_inactive = "%F"
let g:status_inactive .= "%="
let g:status_inactive .= "\ %3p%%\ %3l:%2c\ "

augroup CustomStatusLine
  autocmd!
  autocmd WinEnter,BufWinEnter * setlocal statusline=%!g:status_active
  autocmd WinLeave * setlocal statusline=%!g:status_inactive
augroup END

" Tabline {{{1

function MyTabLine()

  let s = ''
  for i in range(tabpagenr('$'))
    " select the highlighting
    if i + 1 == tabpagenr()
      let s .= '%#TabLineSel#'
    else
      let s .= '%#TabLine#'
    endif
    " set the tab page number (for mouse clicks)
    let s .= '%' . (i + 1) . 'T ' . (i + 1)
    " the label is made by MyTabLabel()
    let s .= ' %{MyTabLabel(' . (i + 1) . ')} '
  endfor

  " after the last tab fill with TabLineFill and reset tab page nr
  " let s .= '%#stl_focus_alt2#⮀'
  let s .= '%#TabLineFill#%T'

  " right-align the label to close the current tab page
  if tabpagenr('$') > 1
    let s .= '%=%#stl_focus_alt2#⮂%#TabLineSel#%999X X '
  endif

  return s
endfunction


function MyTabLabel(n)
    let buflist = tabpagebuflist(a:n)
    let winnr = tabpagewinnr(a:n)
    let l:filename = expand("#" . buflist[winnr - 1] . ":p:t")
    return l:filename ==# '' ? '[No Name]' : l:filename
endfunction

set tabline=%!MyTabLine()

" Tmuxline {{{1

let g:tmuxline_separators = {
    \ 'left' : '⮀',
    \ 'left_alt': '',
    \ 'right' : '⮂',
    \ 'right_alt' : '',
    \ 'space' : ' '}
let g:tmuxline_preset = {
      \ 'a'    : '#S',
      \ 'b'    : ['\uE0A0 #(cd #{pane_current_path}; ' .
      \ 'git rev-parse --abbrev-ref HEAD)' ],
      \ 'c'    : ' ',
      \ 'win'  : ['#I:#W'],
      \ 'cwin' : ['#I:#W #[fg=cyan]✔'],
      \ 'z'    : ['\uF080' . ' '],
      \ 'options' : {'status-justify' : 'left'}
      \ }
let g:tmuxline_theme = {
      \'a'    : [ g:fg_focus[0], g:bg_focus[0], 'bold'],
      \'b'    : [ g:fg_soft[0], g:bg_hard[0] ],
      \'c'    : [ g:fg_soft[0], g:bg_soft[0] ],
      \'bg'   : [ g:fg_soft[0], g:bg_soft[0] ],
      \'win'  : [ g:fg_soft[0], g:bg_soft[0] ],
      \'cwin' : [ g:fg_hard[0], g:bg_hard[0] ],
      \'x'   : [ g:fg_soft[0], g:bg_soft[0] ],
      \'y'   : [ g:fg_hard[0], g:bg_hard[0] ],
      \'z'    : [ g:fg_focus[0], g:bg_focus[0], 'bold']
      \}

if exists('$TMUX')
    autocmd VimEnter * call tmuxline#set_statusline()
endif

