setlocal foldmethod=expr
setlocal foldlevel=0
" setlocal conceallevel=0

setlocal spell
map <C-c>r :exe "SlimuxShellRun source('" . expand("%:p") . "')"<CR>

" nvim-r mapping
inoremap <buffer> >> <Esc>:normal! a%>%<CR>a
inoremap <buffer> __ <Esc>:normal! a<-<CR>a
inoremap <leader>, <C-x><C-o>
" inoremap <Nul> <C-x><C-o>
" imap <leader>. <Plug>RCompleteArgs
" imap <C-space> <Plug>RCompleteArgs
nmap <LocalLeader>ll <Plug>RSendLine

" r folding
function! RFold()
  let this_line = getline(v:lnum)

  if match(this_line, '}') >= 0
    if match(this_line, '{') >= 0
      return '=' " if { and } matches on the same line do not do anything.
    elseif match(this_line, '})\?$') >= 0
      return 's1' " reduce fold only when finish with } or })
    endif
  elseif match(this_line, '{$') >= 0
    return 'a1'
  elseif this_line =~ '^#\s.*---'
  " elseif this_line =~ '^#\s\d.*---' " to not fold commented sections
    return '>1'
  endif
  return '='
endfunction

setlocal foldexpr=RFold()
