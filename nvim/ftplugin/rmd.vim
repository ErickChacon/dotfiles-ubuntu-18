setlocal spell
setlocal foldmethod=syntax
" setlocal foldlevel=0
" call tcomment#DefineType('rmd',         "<!-- %s -->"    )
" call tcomment#DefineType('rmd',         "# %s"    )
" setlocal background=light
" setlocal conceallevel=2
" UltiSnipsAddFiletypes rmd.markdown.r.tex
UltiSnipsAddFiletypes rmd.r.tex
" UltiSnipsAddFiletypes markdown
" map <C-c>r :exe "SlimuxShellRun library(knitr); knit('" . expand("%:p") . "')"<CR>

" nvim-r mapping
inoremap <buffer> >> <Esc>:normal! a%>%<CR>a
inoremap <buffer> __ <Esc>:normal! a<-<CR>a
inoremap <leader>, <C-x><C-o>
" inoremap <Nul> <C-x><C-o>
" imap <leader>. <Plug>RCompleteArgs
" imap <C-space> <Plug>RCompleteArgs
nmap <LocalLeader>ll <Plug>RDSendLine

" to recognize equations in any filetype
call textobj#user#plugin('equation', {
\  'dollar-math-a': {
\     '*pattern*': '[$][^$]*[$]',
\     'select': 'a$',
\ },
\  'dollar-math-i': {
\     '*pattern*': '[$]\zs[^$]*\ze[$]',
\     'select': 'i$',
\ },
\ })
