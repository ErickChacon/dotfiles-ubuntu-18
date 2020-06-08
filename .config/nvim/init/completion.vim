let g:deoplete#enable_at_startup = 1
inoremap <silent><expr><C-J> "\<C-N>"
inoremap <silent><expr><C-K> "\<C-P>"
inoremap <expr><C-h> deoplete#smart_close_popup()
