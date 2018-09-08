" setlocal foldcolumn=10
UltiSnipsAddFiletypes markdown
setlocal foldlevel=1
" function! MyFoldText() " {{{
"     let line = getline(v:foldstart)
"
"     " let nucolwidth = &fdc + &number * &numberwidth
"     " let windowwidth = winwidth(0) - nucolwidth - 15
"     " let foldedlinecount = v:foldend - v:foldstart
"     "
"     " " expand tabs into spaces
"     " let onetab = strpart('          ', 0, &tabstop)
"     " let line = substitute(line, '\t', onetab, 'g')
"     "
"     " let line = strpart(line, 0, windowwidth - 2 -len(foldedlinecount))
"     " let fillcharcount = windowwidth - len(line) - len(foldedlinecount)
"     " return line . ' ' . repeat(" ",fillcharcount) . '--> ' . foldedlinecount . ' lines ' . ' '
"     return line
" endfunction " }}}
setlocal foldtext=MyFoldText()


" Mapping for note taking

nmap <cr> :e <cfile><cr>
nmap <backspace> :e#<cr>
nmap <tab> :call search("(.\\+)")<cr>
nmap <s-tab> :call search("(.\\+)", "b")<cr>

