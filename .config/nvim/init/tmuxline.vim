" IDE: TMUXLINE {{{

" Tmuxline presets
let g:tmuxline_separators = {
    \ 'left' : '',
    \ 'left_alt': '',
    \ 'right' : '',
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

