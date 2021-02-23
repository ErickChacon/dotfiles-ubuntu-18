setlocal spell

" Folding

" setlocal foldmethod=expr
" setlocal foldexpr=GetRmdFold(v:lnum)
" setlocal foldlevel=0
"
" function! GetRmdFold(lnum)
"     if getline(a:lnum) =~? '\v^##'
"         return 'a1'
"     endif
"
"     if getline(a:lnum) =~? '\v^\s*$'
"         if getline(a:lnum + 1) =~? '\v^##'
"             return 's1'
"         endif
"     endif
"
"     return '='
" endfunction
"
" local config
" setlocal formatoptions+=at                       " text wraping
" set foldcolumn=2                                   " fold column
" set foldlevel=1                                    " fold level
" set foldtext=MyFoldText()                          " custom fold text

" Mapping and nvim-r
" inoremap <buffer> >> <Esc>:normal! a%>%<CR>a
" inoremap <buffer> <leader>, <C-x><C-o>

so ~/.config/nvim/ftplugin/r_mappings.vim

" Default snippets
call NeoSnippetAdd("r")

" " Recoganize equations
" call textobj#user#plugin('equation', {
" \  'dollar-math-a': {
" \     '*pattern*': '[$][^$]*[$]',
" \     'select': 'a$',
" \ },
" \  'dollar-math-i': {
" \     '*pattern*': '[$]\zs[^$]*\ze[$]',
" \     'select': 'i$',
" \ },
" \ })
