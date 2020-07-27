" let cmdline_external_term_cmd = "gnome-terminal -e '%s'"
" " let cmdline_in_buffer = 0
"
" let cmdline_map_start          = '<LocalLeader>rf'
" let cmdline_map_quit           = '<LocalLeader>rq'
" " let cmdline_map_send           = '<LocalLeader>ll'
" let cmdline_map_send_and_stay  =  '<LocalLeader>ll'
" let cmdline_map_send_paragraph = '<LocalLeader>pp'
" let cmdline_map_source_fun     = '<LocalLeader>ff'
" let cmdline_map_send_block     = '<LocalLeader>bb'
"
" function StartDocker()
"     let bclapp = b:cmdline_app
"     call inputsave()
"     let container = input('Enter container name: ')
"     call inputrestore()
"     if &filetype == "python"
"         let b:cmdline_app = "docker exec -it " . container . " python"
"     elseif &filetype == "julia"
"         let b:cmdline_app = "docker exec -it " . container . " julia"
"     elseif &filetype == "r"
"         let b:cmdline_app = "docker exec -it " . container . " geospatial"
"     endif
"     call VimCmdLineStartApp()
"     let b:cmdline_app = bclapp
" endfunction
"
" nmap <LocalLeader>rd :call StartDocker()<CR>


function! SlimeOverride_EscapeText_rmd(text)
    let rchunk = match(a:text, '```{r}') " return trimmed
    echo rchunk
    if rchunk < 0
        let text_new = "```{r}\n" . a:text
    else
        let text_new = a:text
    endif
    call system("cat > " . "/tmp/local/test.Rmd", text_new)

    return 'knitr::purl("/tmp/local/test.Rmd", "/tmp/local/test.R", documentation = 0, quiet = TRUE); source("/tmp/local/test.R", echo = TRUE)' . "\n"
endfunction

function! CountChunks()
    let l:count = 0
    Nomove g/^[^$,\"]/let l:count += 1
    return l:count
endfunction

function SlimeGetwd()
    if &filetype == 'r'
        let cmd = "getwd()\n"
    elseif &filetype == 'rmd'
        let cmd = "```{r}\ngetwd()\n"
    endif
    call slime#send(cmd)
endfunction

function SlimeSetwd()
    let wd = expand("%:p:h")
    let wd_new = substitute(wd, expand('~'), '~', '')
    if &filetype == 'r'
        let cmd = "setwd"
    elseif &filetype == 'rmd'
        let cmd = "```{r}\nsetwd"
    endif
    call slime#send(cmd . '("' . wd_new . '")' . "\n")
endfunction

function SlimeAllSend()
    let filepath = expand("%:p")
    let filepath = substitute(filepath, expand('~'), '~', '')
    " let filepath = expand("%:t")
    " call slime#send('source("' . filepath . '")' . "\n")
    if &filetype == "r"
        let command = 'source'
    elseif &filetype == "rmd"
        let command = "```{r}\nrmarkdown::render"
    endif
    call slime#send(command . '("' . filepath . '")' . "\n")
endfunction

" let g:slime_target = "neovim"
let g:slime_target = "tmux"
let g:slime_no_mappings = 1
let g:slime_cell_delimiter = "#%%"
nmap <leader>rf <Plug>SlimeConfig
nmap <leader>ll <Plug>SlimeLineSend
nmap <leader>pp <Plug>SlimeParagraphSend
xmap <leader>ss <Plug>SlimeRegionSend
nmap <leader>ss <Plug>SlimeMotionSend
nmap <leader>cc \ssac
nmap <leader>hh \ssgg
" nmap <leader>ff <Plug>SlimeFunctionSend
nmap <leader>bb ['\ss]'<C-o>
nmap <leader>aa :call SlimeAllSend()<CR>
" nmap <leader>bb <Plug>SlimeSendCell
nmap <silent> <leader>pwd :call SlimeGetwd()<CR>
nmap <silent> <leader>cd :call SlimeSetwd()<CR>

