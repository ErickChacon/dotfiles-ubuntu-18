
" Allow true colors and read palette name
set termguicolors                                  " true colors
set background=dark                                " dark background
let g:path_palname = $HOME.'/.palette-name.vim'    " file to read palette name
if filereadable(g:path_palname)
  let g:scheme_name = substitute(readfile(g:path_palname, '', 1)[0], ".vim$", "", "")
else
  let g:scheme_name = "gruvbox"
endif

" Set selected colorscheme
if g:scheme_name == "nord"
  colorscheme nord
  let g:nord_italic = 1
  let g:nord_italic_comments = 1
  let g:nord_comment_brightness = 20
  let g:nord_statusline_uniform = 0
  hi Conceal guibg=none guifg=#8be9fd gui=none
  hi Folded gui=none guibg=#3b4252 guifg=#7b88a1
  hi Title gui=bold guifg=#d8dee9
  hi SpellBad guifg=none
elseif g:scheme_name == "gruvbox"
  set background=dark
  let g:gruvbox_italic = 1
  let g:gruvbox_italicize_strings = 1
  let g:gruvbox_italicize_comments = 1
  let g:gruvbox_contrast_dark = "soft"
  let g:gruvbox_contrast_light = "soft"
  colorscheme gruvbox
  hi link Function GruvboxAqua
elseif g:scheme_name == "material-theme"
  colorscheme material-theme
  hi Conceal guibg=NONE guifg=#F77669 gui=none
elseif g:scheme_name == "deus"
  let g:deus_bold=0
  let g:deus_italic=1
  colorscheme deus
  hi texBeginEnd gui=bold,italic guifg=#ffffff
elseif g:scheme_name == "one"
  let g:one_allow_italics = 1
  colorscheme one
  call one#highlight('Folded', '5c6370', '2c323c', 'italic')
  " call one#highlight('Conceal', '5c6370', '2c323c')
  hi Conceal guibg=NONE guifg=#e5c07b gui=none
elseif g:scheme_name == "dracula"
  colorscheme dracula
  hi Conceal guibg=NONE guifg=#8be9fd gui=none
  hi Folded guibg=#333333 guifg=#6272a4 gui=none
elseif g:scheme_name == "neodark"
  let g:neodark#use_256color = 1
  let g:neodark#italics = 1
  colorscheme neodark
  hi SpellBad guibg=none guifg=none gui=underline
  " hi Folded guibg=#263a45 guifg=#658595
  hi Folded guibg=#3a3a3a guifg=#8a8a8a
elseif g:scheme_name == "space-vim-dark"
  colorscheme space-vim-dark
  hi Conceal guibg=none guifg=#2aa1ae
  hi SpellBad guibg=none guifg=none gui=underline
  hi Function gui=none
  hi Folded gui=none
  hi Comment gui=italic guifg=#2A6B74
elseif g:scheme_name == "monokai"
  colorscheme monokai
  hi Conceal guibg=none guifg=LightGrey
elseif g:scheme_name == "tender"
  colorscheme tender
  hi Conceal guibg=none guifg=LightGrey
elseif g:scheme_name == "alduin"
  colorscheme alduin
  hi Conceal guibg=none
elseif g:scheme_name == "crunchbang"
  colorscheme crunchbang
  hi Conceal guibg=none
elseif g:scheme_name == "deep-space"
  colorscheme deep-space
  hi Folded guifg=#51617d guibg=#232936
  hi Conceal guibg=none
elseif g:scheme_name == "hybrid"
  colorscheme hybrid
  hi Folded guibg=#282a2e
  hi SpellBad guibg=none guifg=#707880 gui=italic,underline
  hi Conceal guibg=none
elseif g:scheme_name == "lucid"
  colorscheme lucid
  hi CursorLine guifg=none
  hi! link ColorColumn CursorLine
elseif g:scheme_name == "two-firewatch"
  colorscheme two-firewatch
  hi Conceal guibg=none
  hi! link Folded CursorLine
  hi SpellBad guibg=none guifg=#5c6370 gui=italic,underline
elseif g:scheme_name == "onehalfdark"
  execute 'colorscheme ' . g:scheme_name
  hi SpellBad guibg=none guifg=#5c6370 gui=italic,underline
  hi! link Folded CursorLine
else
  execute 'colorscheme ' . g:scheme_name
" elseif g:random_number == 9
  " colorscheme challenger_deep
  " hi Conceal guibg=none guifg=#ff5458
  " hi Folded gui=none guibg=#100e23 guifg=#767676
  " hi SpellBad guibg=none guifg=none gui=underline
endif

" Create palette colors
let g:nvim_background = synIDattr(synIDtrans(hlID('Normal')), 'bg', 'gui')
let g:nvim_foreground = synIDattr(synIDtrans(hlID('Normal')), 'fg', 'gui')
" let g:COLOR_01 = synIDattr(synIDtrans(hlID('Visual')), 'bg', 'gui')
let g:COLOR_01 = synIDattr(synIDtrans(hlID('CursorLineNr')), 'bg', 'gui')
let g:COLOR_02 = synIDattr(synIDtrans(hlID('String')), 'fg', 'gui')
let g:COLOR_03 = synIDattr(synIDtrans(hlID('Identifier')), 'fg', 'gui') " Precision
" let g:COLOR_03 = synIDattr(synIDtrans(hlID('Normal')), 'fg', 'gui') " Precision, tab bg ranger
let g:COLOR_04 = synIDattr(synIDtrans(hlID('Identifier')), 'fg', 'gui')
let g:COLOR_05 = synIDattr(synIDtrans(hlID('Comment')), 'fg', 'gui')
let g:COLOR_06 = synIDattr(synIDtrans(hlID('Identifier')), 'fg', 'gui')
let g:COLOR_07 = synIDattr(synIDtrans(hlID('Function')), 'fg', 'gui')
let g:COLOR_08 = synIDattr(synIDtrans(hlID('Special')), 'fg', 'gui')
let g:COLOR_09 = synIDattr(synIDtrans(hlID('Visual')), 'bg', 'gui')
" let g:COLOR_10 = synIDattr(synIDtrans(hlID('Statement')), 'fg', 'gui') " folder ranger
" let g:COLOR_10 = synIDattr(synIDtrans(hlID('Normal')), 'bg', 'gui') " folder ranger
let g:COLOR_10 = synIDattr(synIDtrans(hlID('Normal')), 'fg', 'gui') " folder ranger
let g:COLOR_11 = synIDattr(synIDtrans(hlID('Define')), 'fg', 'gui') " chaconmo
let g:COLOR_12 = synIDattr(synIDtrans(hlID('CursorLineNr')), 'fg', 'gui')
let g:COLOR_13 = synIDattr(synIDtrans(hlID('Number')), 'fg', 'gui')
let g:COLOR_14 = synIDattr(synIDtrans(hlID('String')), 'fg', 'gui')
let g:COLOR_15 = synIDattr(synIDtrans(hlID('Function')), 'fg', 'gui')
let g:COLOR_16 = synIDattr(synIDtrans(hlID('TypeDef')), 'fg', 'gui')
let g:my_colors = [g:nvim_background, g:nvim_foreground, g:COLOR_01, g:COLOR_02, g:COLOR_03,
      \ g:COLOR_04, g:COLOR_05, g:COLOR_06, g:COLOR_07, g:COLOR_08, g:COLOR_09, g:COLOR_10,
      \ g:COLOR_11, g:COLOR_12, g:COLOR_13, g:COLOR_14, g:COLOR_15, g:COLOR_16]

" Nvim terminal colors
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

