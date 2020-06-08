setlocal textwidth=80
setlocal spell
setlocal nofoldenable

" autocmd BufNewFile,Bufread index.md setlocal nofoldenable
" setlocal formatoptions+=at                       " text wraping
"
" " " to recognize equations in any filetype
" " call textobj#user#plugin('equation', {
" " \  'dollar-math-a': {
" " \     '*pattern*': '[$][^$]*[$]',
" " \     'select': 'a$',
" " \ },
" " \  'dollar-math-i': {
" " \     '*pattern*': '[$]\zs[^$]*\ze[$]',
" " \     'select': 'i$',
" " \ },
" " \ })
"
"   " if !get(g:, 'mywaikikisetup_loaded', 0)
"   "   call mywaikiki#Load()
"   "   let g:mywaikikisetup_loaded = 1
"   " endif
"   "
" nmap <silent> <BS> :BufSurfBack<CR>
" nmap  <buffer>  <tab>       <Plug>(waikikiNextLink)
" nmap  <buffer>  <c-tab>       <Plug>(waikikiPrevLink)
" nmap  <buffer>  <cr>     <Plug>(waikikiFollowLink)
" nmap  <buffer>  <LocalLeader>u        <Plug>(waikikiGoUp)
