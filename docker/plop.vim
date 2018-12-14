
" let r_syntax_folding = 1 " need improves foolding
" to highlight r code in rmd
" let rrst_syn_hl_chunk = 1
let rmd_syn_hl_chunk = 1 " to highlight the fisrt line
let g:rmd_syn_langs = ["r", "python", "c"]
" It is only required if vim-pandoc is not installed
" augroup pandoc_syntax
"       au! BufNewFile,BufFilePre,BufRead *.md set filetype=markdown.pandoc
" augroup END
" augroup pandoc_syntax
"       au! BufNewFile,BufFilePre,BufRead *.pmd set filetype=markdown.pandoc
" augroup END
let g:pandoc#syntax#codeblocks#embeds#langs = ["cpp", "r", "bash=sh", "python"]
" let g:pandoc#folding#fold_fenced_codeblocks = 1
" let g:pandoc#folding#fdc = 0
let g:pandoc#syntax#conceal#urls = 1
" let g:pandoc#syntax#style#underline_special = 0
let g:pandoc#syntax#conceal#use = 1 " pretty highlight
" autocmd FileType * setlocal conceallevel=0
" let g:pandoc#keyboard#blacklist_submodule_mappings =  ["lists", "references", "styles", "sections", "links"]
" let g:pandoc#keyboard#blacklist_submodule_mappings =  ["references"]

let g:pandoc#hypertext#use_default_mappings=0
" let g:pandoc#filetypes#pandoc_markdown=0

let g:pandoc#modules#disabled = ["folding"]

" let hostname = substitute(system('hostname'), '\n', '', '')
" if hostname == "chaconmo-ThinkPad-L470-W10DG"
  " let R_in_buffer = 0 " 0 to not open in an nvim external terminal emulator
" elseif hostname == "chaconmo-Precision-5510"
  " if exists("g:gui_oni")
  "   let R_in_buffer = 1 " 0 to not open in an nvim external terminal emulator
  " else
  "   let R_in_buffer = 0 " 0 to not open in an nvim external terminal emulator
  " endif
  " Open R in a tmux split
  let R_source = '~/.local/share/nvim/plugged/Nvim-R/R/tmux_split.vim'
  " let R_applescript = 0
  " let R_tmux_split = 1
" endif

" Open R in an external tmux terminal
" let R_in_buffer = 0 " 0 to not open in an nvim external terminal emulator
" Other tmux options
let R_tmux_title = "automatic" " tmux window names
let R_objbr_place = "script,right"
" Shortcuts
let R_assign = 0
" Splits distribution
" let R_editor_w = 30
" let R_rconsole_width = 86
let R_rconsole_height = 10
" let R_rconsole_width = 0
" Functions arguments
" let R_show_args = 1 " show arguments in a new pane after omnicompletion
" let R_show_arg_help = 1 " show arguments help after completion
let R_args_in_stline = 1 " show arguments on the status line
" Markdown options
let R_openhtml = 1
let R_pdfviewer = "evince"
" Highlighting
" let R_start_libs = "base,stats,graphics,grDevices,utils,methods"
" let R_hi_fun = 0 " 0 to not Highlight functions, problem with ROnJobStdout
let R_hi_fun_paren = 1 " only highlight if ( is typed
