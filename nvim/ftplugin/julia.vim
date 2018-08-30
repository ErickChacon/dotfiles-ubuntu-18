
" PROGRAMS: JULIA VIMCMDLINE
let cmdline_map_start          = "<LocalLeader>rf"
let cmdline_map_quit           = "<LocalLeader>rq"
" let cmdline_map_send           = "<LocalLeader>ll"
let cmdline_map_send_and_stay  =  "<LocalLeader>ll"
let cmdline_map_send_paragraph = "<LocalLeader>pp"
let cmdline_map_source_fun     = "<LocalLeader>aa"
let cmdline_map_send_block     = "<LocalLeader>bb"
nmap <localleader>rp :call VimCmdLineSendCmd(expand("<cword>"))<cr>
nmap <localleader>rh :call VimCmdLineSendCmd("?".expand("<cword>"))<cr>
