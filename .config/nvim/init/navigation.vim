" Nerdtree {{{1

" set splitright
" let g:netrw_winsize = 20
" let g:netrw_browse_split = 4
" let g:netrw_banner = 0
" map <leader>n :NERDTreeToggle<CR>
" let NERDTreeMapOpenSplit='v'
" let NERDTreeMapOpenVSplit=';'
" let NERDTreeMapOpenInTab='T'
" let NERDTreeMapOpenInTabSilent='t'
" let NERDTreeWinSize = 25
" let NERDTreeIgnore = ['\.aux$', '\.fdb_latexmk$', '\.fls', '\.log', '\.out',
"       \ '\.synctex.gz']
"
" function! NERDTreeHighlightFile(extension, fg, bg, guifg)
" exec 'autocmd FileType nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guifg='. a:guifg
" exec 'autocmd FileType nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
" endfunction

" Netrw {{{1

" Appearence
let g:netrw_banner = 0

" Where to open files
let g:netrw_alto = 0 " horizontal window (above)
let g:netrw_altv = 1 " vertical window (right)
let g:netrw_preview = 1 " preview window (vertical)

" Project drawer like NERDTree (Lexplore)
let g:netrw_usetab = 1
let g:netrw_wiw = 1
nmap <unique> <leader>n <Plug>NetrwShrink

" Colors
let g:netrw_special_syntax = 1
"  hi netrwR	  term=NONE cterm=NONE gui=NONE ctermfg=9 guifg=blue ctermbg=0 guibg=black

" Line numbering
let g:netrw_bufsettings="noma nomod nonu nobl nowrap ro rnu"

" Vim-bufsurf {{{1

nnoremap <silent> <BS> :BufSurfBack<CR>
nnoremap <silent> <F2> :BufSurfForward<CR>

