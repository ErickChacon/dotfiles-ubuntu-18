" Nerdtree {{{1

set splitright
map <leader>n :NERDTreeToggle<CR>
let NERDTreeMapOpenSplit='v'
let NERDTreeMapOpenVSplit=';'
let NERDTreeMapOpenInTab='T'
let NERDTreeMapOpenInTabSilent='t'
let NERDTreeWinSize = 25
let NERDTreeIgnore = ['\.aux$', '\.fdb_latexmk$', '\.fls', '\.log', '\.out',
      \ '\.synctex.gz']

function! NERDTreeHighlightFile(extension, fg, bg, guifg)
exec 'autocmd FileType nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guifg='. a:guifg
exec 'autocmd FileType nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

" Vim-bufsurf {{{1

nnoremap <silent> <BS> :BufSurfBack<CR>
nnoremap <silent> <F2> :BufSurfForward<CR>

