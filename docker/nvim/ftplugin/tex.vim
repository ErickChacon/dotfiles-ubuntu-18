setlocal spell
setlocal foldlevel=0
setlocal conceallevel=2
setlocal formatoptions-=t " text wraping: it changes depending of the filetype

" setlocal textwidth=0
" ino $ $$<left>
" setlocal background=light " does not work properly
" setlocal background=light
" hi! link FoldColumn GruvboxRed
"
" " Basic setup
" set foldtext=MyFoldText()
let g:surround_{char2nr('c')} = "\\\1command\1{\r}"
