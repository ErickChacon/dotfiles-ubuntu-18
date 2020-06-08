" Neovim settings
" Language:     Neovim
" Last Change:  12 May 2019
"

" Read plugins
so ~/.config/nvim/plugins.vim

" Select palette and create colors
so ~/.config/nvim/init-select-pal.vim

" Export palette colors
let g:nvim_colors_file = '/tmp/local/.nvim_colors.vim'
call system('mkdir -p "$(dirname ' . g:nvim_colors_file . ')"')
call writefile(g:my_colors, g:nvim_colors_file, 'b')

