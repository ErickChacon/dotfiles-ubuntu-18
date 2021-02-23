setlocal textwidth=80
setlocal spell
setlocal nofoldenable

call textobj#user#plugin('chunk', {
\   'angle': {
\     'pattern': ['^```[{a-z]', '^```$'],
\     'select-a': 'ac',
\     'select-i': 'ic',
\   },
\ })

" setlocal formatoptions+=at                       " text wraping

" " to recognize equations in any filetype
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

