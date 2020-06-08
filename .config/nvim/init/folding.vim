
" Custom fold text
function! MyFoldText() " {{{
  let line = getline(v:foldstart)
  let nucolwidth = &fdc + &number * &numberwidth
   " if g:gitgutter_enabled
   "   let wider = 2
   " else
   "   let wider = 0
   " endif
  let wider = 2

  let windowwidth = winwidth(0) - nucolwidth - 12 - wider
  let foldedlinecount = v:foldend - v:foldstart

  let onetab = strpart('          ', 0, &tabstop)
  let line = substitute(line, '\t', onetab, 'g')

  let line = strpart(line, 0, windowwidth - 2 -len(foldedlinecount))
  let fillcharcount = windowwidth - len(line) - len(foldedlinecount)
  return line . ' ' . repeat(" ",fillcharcount) . '  ➜ ' . foldedlinecount . ' lines ' . '✤ '
endfunction " }}}

" Folding setting
set foldmethod=marker                        " marker to fold
set foldtext=MyFoldText()                    " custom fold text
set foldlevel=1                              " fold always
set foldcolumn=2                             " fold column
hi! link FoldColumn Statement                " fold column color
