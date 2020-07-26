let cmdline_external_term_cmd = "gnome-terminal -e '%s'"
" let cmdline_in_buffer = 0

let cmdline_map_start          = '<LocalLeader>rf'
let cmdline_map_quit           = '<LocalLeader>rq'
" let cmdline_map_send           = '<LocalLeader>ll'
let cmdline_map_send_and_stay  =  '<LocalLeader>ll'
let cmdline_map_send_paragraph = '<LocalLeader>pp'
let cmdline_map_source_fun     = '<LocalLeader>ff'
let cmdline_map_send_block     = '<LocalLeader>bb'

function StartDocker()
    let bclapp = b:cmdline_app
    call inputsave()
    let container = input('Enter container name: ')
    call inputrestore()
    if &filetype == "python"
        let b:cmdline_app = "docker exec -it " . container . " python"
    elseif &filetype == "julia"
        let b:cmdline_app = "docker exec -it " . container . " julia"
    elseif &filetype == "r"
        let b:cmdline_app = "docker exec -it " . container . " geospatial"
    endif
    call VimCmdLineStartApp()
    let b:cmdline_app = bclapp
endfunction

nmap <LocalLeader>rd :call StartDocker()<CR>

