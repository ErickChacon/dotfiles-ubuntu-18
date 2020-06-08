
" " PROGRAMS: VIMWIKI {{{
"
" au FileType vimwiki set syntax=pandoc
" " Vimkiwi setup
" let g:vimwiki_list = [{'path':'$HOME/Documents/Nvim/Vimwiki',
"                      \ 'syntax': 'markdown', 'ext': '.wiki'}]
"                      " \ 'syntax': 'markdown', 'ext': '.wiki'}]
"                      " \ {'path':'$HOME/Documents/Repositories/MyWebPage/_drafts',
"                      " \ 'syntax': 'markdown', 'ext': '.md'}]
" let g:vimwiki_table_mappings = 0
" let $blogdir = '/home/chaconmo/Documents/Repositories/erickchacon/'
" " let g:vimwiki_folding='list' # not very well implemented
" " let g:vimwiki_folding='expr'
" " let g:vimwiki_global_ext = 0 " do not override markdown outside vimwiki folder.
" " let g:vimwiki_char_bold = '**'
" " let g:vimwiki_char_italic = '_'
" " inoremap <F13> <Esc>:VimwikiReturn 1 5<CR>
" " nmap <Leader>w <Plug>VimwikiIndex
" " nmap <Leader>wf <Plug>VimwikiFollowLink
" " nmap <Leader>wn <Plug>VimwikiNextLink
" " imap <Leader>wn <Plug>vimwiki_i_<CR>
" " nmap <Leader>eq <plug>(vimtex-a$)
" " inoremap <Leader> <CR> <C-r>=<SID>my_cr_function()<CR>
" " function! s:my_cr_function() abort
" "   return deoplete#close_popup() . "\<CR>"
" " endfunction
" " map <buffer> <C-G> :s/^/\/\//<Esc><Esc>
"
" " Spelling
" " set spell spelllang=en_us
" " set spell
" hi! link VimwikiHeader1 WarningMsg
" hi! link VimwikiHeader2 PreProc
" hi! link VimwikiHeader3 Boolean
" hi! link VimwikiHeader4 Type
" hi! link VimwikiHeader5 Identifier
" hi! link VimwikiHeader6 String
" " hi! link pandocSetexHeader WarningMsg
" " hi! link Title WarningMsg
" " hi! link Title Define
" " hi Title gui=bold
"
" Bullets.vim
let g:bullets_enabled_file_types = [
    \ 'markdown',
    \ 'pandoc',
    \ 'rmd'
    \]
" " autocmd BufRead,BufNewFile ~/Documents/Organizer/index.md setlocal formatoptions-=ta
" " autocmd BufRead,BufWinEnter  /home/rstudio/Documents/Organizer/index.md  setlocal formatoptions-=t
" " autocmd BufRead,BufWinEnter  /home/rstudio/Documents/Organizer/index.md echo "hola"
" " gf to create if file does not exits
"
" " nmap gf :e <cfile><CR>
"
" " hi! link VimwikiHeader1 GruvboxRedBold
" " hi! link VimwikiHeader2 GruvboxAquaBold
" " hi! link VimwikiHeader3 GruvboxPurpleBold
" " hi! link VimwikiHeader4 GruvboxYellowBold
" " hi! link VimwikiHeader5 GruvboxBlueBold
" " hi! link VimwikiHeader6 GruvboxGreenBold
"
" " let g:wiki_root = '~/Documents/Organizer'
" let g:wiki_root = '~/Documents/Organizer'
" let g:wiki_filetypes = ['md']
" let g:wiki_link_target_map = 'Sanitize'

