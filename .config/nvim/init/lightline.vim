" Lightline {{{

" Lightline custom functions

function! MyFiletype() " {{{
  " return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' : 'no ft') : ''
endfunction " }}}
" function! MyFiletypeIcon(n) " {{{
"   return winwidth(0) > 70 ? (strlen(&filetype) ?  WebDevIconsGetFileTypeSymbol() : '') : ''
" endfunction " }}}
function! MyFileformat() " {{{
  return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
endfunction
function! Lightlinegit()
    let l:branch = fugitive#head()
    return l:branch ==# '' ? '' : "\uE0A0" . " " . l:branch
endfunction " }}}
function! Sy_stats_wrapper() " {{{
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
endfunction " }}}

" Lightline format {{{
let g:lightline = {}
let g:lightline.colorscheme = 'yourcolorscheme'
let g:lightline.component = {
      \ 'empty': '',
      \ 'filepath': '%F'}
let g:lightline.component_function = {
      \ 'gitbranch': 'Lightlinegit',
      \ 'gitstatus': 'Sy_stats_wrapper',
      \ 'filetype': 'MyFiletype',
      \ 'fileformat': 'MyFileformat',
      \ }
" let g:lightline.tab_component_function = {
"       \ 'filetypeicon': 'MyFiletypeIcon',
"       \ }
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
" }}}

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

" Define colorscheme {{{
let s:p = {'normal': {}, 'tabline': {}, 'insert':{}, 'visual':{}, 'inactive':{}}
let s:p.normal.left = [
      \ [ g:fg_focus, g:bg_focus, 'bold' ],
      \ [ g:fg_hard, g:bg_hard ],
      \]
let s:p.normal.middle = [
      \ [ g:fg_soft, g:bg_soft ] ]
let s:p.normal.right = [
      \ [ g:fg_focus, g:bg_focus, 'bold' ],
      \ [ g:fg_hard, g:bg_hard ],
      \ [ g:fg_soft, g:bg_soft ] ]
let s:p.tabline.left = [ [ g:fg_hard, g:bg_hard ] ]
let s:p.tabline.tabsel = [ [ g:fg_focus, g:bg_focus ] ]
let s:p.tabline.middle = [ [ g:fg_soft, g:bg_soft ] ]
let s:p.insert.left = [
      \ [ g:fg_focus, s:bg_insert, 'bold' ],
      \ [ g:fg_hard, g:bg_hard ]
      \ ]
let s:p.insert.right = [
      \ [ g:fg_focus, s:bg_insert, 'bold' ],
      \ [ g:fg_hard, g:bg_hard ]
      \ ]
let s:p.visual.left = [
      \ [ g:fg_focus, s:bg_visual, 'bold' ],
      \ [ g:fg_hard, g:bg_hard ]
      \ ]
let s:p.visual.right = [
      \ [ g:fg_focus, s:bg_visual, 'bold' ],
      \ [ g:fg_hard, g:bg_hard ]
      \ ]
let s:p.inactive.left = [[ s:fg_inactive, g:bg_soft, 'italic' ], [ s:fg_inactive, g:bg_soft ]]
let s:p.inactive.right = [ [ s:fg_inactive, g:bg_soft], [ s:fg_inactive, g:bg_soft ] ]
let s:p.inactive.middle = [ [ s:fg_inactive, g:bg_soft ] ]
" }}}


" Lightline assign colorscheme
let g:lightline#colorscheme#yourcolorscheme#palette = lightline#colorscheme#flatten(s:p)

" Tmuxline {{{

"  \ 'separator': { 'left': '⮀', 'right': '⮂' },
"  \ 'subseparator': { 'left': '⮁', 'right': '⮃' }

" Tmuxline presets
let g:tmuxline_separators = {
    \ 'left' : '⮀',
    \ 'left_alt': '',
    \ 'right' : '⮂',
    \ 'right_alt' : '',
    \ 'space' : ' '}
let g:tmuxline_preset = {
      \ 'a'    : '#S',
      \ 'win'  : ['#I:#W'],
      \ 'cwin' : ['#I:#W #[fg=cyan]✔'],
      \ 'x'    : '',
      \ 'y'    : '',
      \ 'z'    : ['\uF080' . ' '],
      \ 'options' : {'status-justify' : 'left'}
      \ }
let g:tmuxline_theme = {
      \'a'    : [ g:fg_focus[0], g:bg_focus[0], 'bold'],
      \'b'    : [ g:fg_soft[0], g:bg_soft[0] ],
      \'c'    : [ g:fg_soft[0], g:bg_soft[0] ],
      \'bg'   : [ g:fg_soft[0], g:bg_soft[0] ],
      \'win'  : [ g:fg_soft[0], g:bg_soft[0] ],
      \'cwin' : [ g:fg_hard[0], g:bg_hard[0] ],
      \'x'   : [ g:fg_soft[0], g:bg_soft[0] ],
      \'y'   : [ g:fg_hard[0], g:bg_hard[0] ],
      \'z'    : [ g:fg_focus[0], g:bg_focus[0], 'bold']
      \}

" Active tmuxline
if exists('$TMUX')
    autocmd VimEnter * call tmuxline#set_statusline()
endif

