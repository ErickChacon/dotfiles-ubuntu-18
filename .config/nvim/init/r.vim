" R configuration

let R_source = '~/.local/share/nvim/plugged/Nvim-R/R/tmux_split.vim'
let R_args = ['--no-save', '--quiet']                       " R arguments
let R_tmux_title = "automatic"                              " tmux window names
let R_objbr_place = "script,left"                           " object split position
" let R_objbr_place = "script,right"                          " object split position
let R_objbr_w = 32                                          " object split with
let R_objbr_opendf = 0                                      " close data.frames
let R_assign = 3                                            " _ as <-
let R_rconsole_height = 5                                  " console height
" let R_args_in_stline = 1                                    " arguments on status line
let R_openhtml = 1                                          " open in html
let R_pdfviewer = "evince"                                  " pdf viewer
let R_editor_w = 90                                         " editor split width
let R_editor_h = 60                                         " help split width
" let r_syntax_folding = 1

" Completion
" let R_start_libs = ''
" let R_show_arg_help = 0

" Rmd configuration

let rmd_syn_hl_chunk = 1
" let g:rmd_syn_langs = ['r', "python", "c"] " engines for chunks
let g:rmd_fenced_languages = ['r']

" NOTE: In case g:rmd_fenced_languages is empty, rmd syntax will remove
" g:markdown_fenced_languages, consequently fenced languages will be removed from
" markdown documents.

au BufNewFile,BufRead *.Rmarkdown set filetype=rmd
au BufNewFile,BufRead *.Rmkd set filetype=rmd

command! Reprodown
      \ call system("r -e 'reprodown::makefile()'")


