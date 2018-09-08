" " PROGRAMS: PYTHON IRON.NVIM
" nmap <localleader>rf :IronRepl<cr>
" nmap <localleader>ll :call IronSend(getline('.'))<cr>
" nmap <localleader>rp :call IronSend(expand("<cword>"))<cr>
" nmap <localleader>rh :call IronSend("?".expand("<cword>"))<cr>
" nmap <localleader>pp <Plug>(iron-send-motion)ap
" vmap <localleader>ss <Plug>(iron-send-motion)
" nmap <localleader>bb ]'<Plug>(iron-send-motion)['
" nmap <localleader>aa gg<Plug>(iron-send-motion)G
" nmap <localleader>r <Plug>(iron-send-motion)

" PROGRAMS: PYTHON IRON.NVIM
let cmdline_map_start          = "<LocalLeader>rf"
let cmdline_map_quit           = "<LocalLeader>rq"
" let cmdline_map_send         = "<LocalLeader>ll"
let cmdline_map_send_and_stay  = "<LocalLeader>ll"
let cmdline_map_send_paragraph = "<LocalLeader>pp"
let cmdline_map_source_fun     = "<LocalLeader>aa"
let cmdline_map_send_block     = "<LocalLeader>bb"
nmap <localleader>rp :call VimCmdLineSendCmd(expand("<cword>"))<cr>
" setlocal iskeyword+=.
nmap <localleader>rh :call VimCmdLineSendCmd("?".expand("<cWORD>"))<cr>

