let g:chunk_language = "r"

function! SlimeOverride_EscapeText_rmd(text)

    if a:text !~ "```"
        let trimmed = a:text
    else
        let splited = split(a:text, "\n")
        let nlines = len(splited)
        let rlines = nlines
        let line_number = 0

        " initialize inside or outside chunk
        let first_open = match(a:text, "```[{a-z]")
        let first_close = match(a:text, "```\n")

        let chunk = 0
        if first_open < 0
            let chunk = 1
        elseif first_close > -1 && first_close < first_open
            let chunk = 1
        endif
        let chunk_next = chunk

        " regex
        if g:chunk_language == "r"
            let chunk_open  = "^```{r.*}$"
            let chunk_close = "^```$"
        elseif g:chunk_language == "julia"
            let chunk_open = "^```julia$"
            let chunk_close = "^```"
        endif

        " clean lines
        while rlines > 0
            " define is inside of chunk
            if splited[line_number] =~ chunk_open
                let chunk = 0
                let chunk_next = 1
            elseif splited[line_number] =~ chunk_close
                let chunk = 0
                let chunk_next = 0
            elseif splited[line_number] =~ "^#"
                let chunk = 0
            elseif splited[line_number] == ""
                let chunk = 0
            endif
            " if outside chunk remove line
            if chunk == 0
                call remove(splited, line_number)
            else
                let line_number = line_number + 1
            endif
            " update next chunk
            let chunk = chunk_next
            let rlines = rlines - 1
        endw

        let trimmed = join(splited, "\n") . "\n"
    endif

    return "\n" . trimmed
endfunction

function! SlimeOverride_EscapeText_jmd(text)
    call SlimeOverride_EscapeText_rmd(text)
endfunction


function! CountChunks()
    let l:count = 0
    Nomove g/^[^$,\"]/let l:count += 1
    return l:count
endfunction

function SlimeAllSend()
    let filepath = expand("%:p")
    let filepath = substitute(filepath, expand('~'), '~', '')
    if &filetype == "r"
        let cmd = 'source("' . filepath . '")'
    elseif &filetype == "rmd"
        let path_head = fnamemodify(filepath, ":h")
        let file_bookdown = join([path_head, "_bookdown.yml"], "/")
        if filereadable(expand(file_bookdown))
            let cmd = 'bookdown::preview_chapter("' . filepath .
                        \ '", "bookdown::gitbook")'
        else
            let cmd = 'rmarkdown::render("' . filepath . '")'
        endif
    elseif &filetype == "julia"
        let filepath = substitute(filepath, '\~', '$(homedir())', '')
        let cmd = 'include("' . filepath . '")'
    elseif &filetype == "tex"
        let cmd = "pdflatex " . filepath
    endif
    call slime#send(cmd . "\n")
endfunction

function SlimeAllSendB()
    let filepath = expand("%:p")
    let filepath = substitute(filepath, expand('~'), '~', '')
    if &filetype == "tex"
        let auxpath = fnamemodify(filepath, ":t:r")
        let cmd = "pdflatex " . filepath
        let cmd = cmd . " && bibtex " . auxpath . " && " . cmd . " && " . cmd
    elseif &filetype == "rmd"
        " let cmd = 'rmarkdown::render("' . filepath . '")'
        let path_head3 = fnamemodify(filepath, ":h:h:h")
        let file_blogdown3 = join([path_head3, "config.toml"], "/")
        if filereadable(expand(file_blogdown3))
            let filepath_short = substitute(filepath, path_head3 . '/', '', '')
            let filepath_short = substitute(filepath_short, '\~', '', '')
            let cmd = 'blogdown:::build_rmds("' . filepath_short . '")'
        else
            let cmd = ""
        endif
    elseif &filetype == "julia"
        let filepath = substitute(filepath, '\~', '$(homedir())', '')
        let path_head = fnamemodify(filepath, ":h")
        let cmd = 'using Weave; weave("' . filepath . '", out_path = "' . path_head .
                    \ '", fig_path = "figures")'
    endif
    call slime#send(cmd . "\n")
endfunction

function SlimeServeSend()
    let filepath = expand("%:p")
    let filepath = substitute(filepath, expand('~'), '~', '')
    if &filetype == "rmd"
        let path_head = fnamemodify(filepath, ":h")
        let file_bookdown = join([path_head, "_bookdown.yml"], "/")
        if filereadable(expand(file_bookdown))
            let cmd = 'echo ' . filepath .
                        \ ' | entr Rscript -e "bookdown::preview_chapter(' .
                        \ "'" . filepath . "', 'bookdown::gitbook')" . '"'
        else
            let cmd = 'echo ' . filepath .
                        \ ' | entr Rscript -e "rmarkdown::render(' .
                        \ "'" . filepath . "')" . '"'
        endif
    elseif &filetype == "tex"
            let cmd = 'echo ' . filepath .
                        \ ' | entr pdflatex ' . filepath
    else
        let cmd = ""
    endif
    call slime#send(cmd . "\n")
endfunction

function SlimeHugoSend()
    let filepath = expand("%:p")
    let filepath = substitute(filepath, expand('~'), '~', '')
    if &filetype == "rmd"
        let cmd = "system('/usr/bin/hugo server -w -p 8787 --bind=0.0.0.0 " .
                    \ " --disableFastRender --forceSyncStatic --gc')"
    else
        let cmd = ""
    endif
    call slime#send(cmd . "\n")
endfunction

function SlimeHugoBashSend()
    let filepath = expand("%:p")
    let filepath = substitute(filepath, expand('~'), '~', '')
    let cmd = "/usr/bin/hugo server -w -p 8787 --bind=0.0.0.0 " .
                \ "--disableFastRender --forceSyncStatic --gc"
    call slime#send(cmd . "\n")
endfunction

function GetHtmlName(filepath)
    let path_head = fnamemodify(a:filepath, ":h")
    let path_tail = fnamemodify(a:filepath, ":t:r") . ".html"

    " if bookdown, change folder and file names
    let file_bookdown = join([path_head, "_bookdown.yml"], "/")
    if filereadable(expand(file_bookdown))
        let path_head = join([path_head, "public"], "/")
        " let path_tail = substitute(path_tail, "^[0-9]*-*", "", "")
    endif

    return join([path_head, path_tail], "/")
endfunction

function FirefoxOpen()
    let filepath = expand("%:p")
    let filepath = substitute(filepath, expand('~'), '~', '')

    if &filetype == "rmd"
        let filepath_html = GetHtmlName(filepath)
    elseif &filetype == "html"
        let filepath_html = GetHtmlName(filepath)
    elseif &filetype == "julia"
        let filepath_html = GetHtmlName(filepath)
    else
        let filepath_html = ""
    endif

    if filepath_html != ""
        let cmd_firefox = 'firefox ' . filepath_html . ' &'
        call system(cmd_firefox)
    endif
endfunction

function FirefoxUpdateSync()
    let filepath = expand("%:p")
    let filepath = substitute(filepath, expand('~'), '~', '')

    if &filetype == "rmd"
        let filepath_html = GetHtmlName(filepath)
    elseif &filetype == "html"
        let filepath_html = GetHtmlName(filepath)
    elseif &filetype == "julia"
        let filepath_html = GetHtmlName(filepath)
    else
        let filepath_html = ""
    endif

    if filepath_html != ""
        let cmd_firefox = 'echo ' . filepath_html . " | entr update-preview.sh &"
        call FirefoxUpdateKill()
        call system(cmd_firefox)
    endif
endfunction

function FirefoxUpdateKill()
    call system('pkill -f "entr update-preview.sh" && exit')
endfunction

function SlimeGetwd()
    if &filetype == 'rmd'
        let cmd = Getwd(g:chunk_language)
    else
        let cmd = Getwd(&filetype)
    endif
    call slime#send(cmd . "\n")
endfunction

function Getwd(lang)
    if a:lang == 'r'
        let cmd = "getwd()"
    elseif a:lang == 'julia'
        let cmd = "pwd()"
    else
        let cmd = "pwd"
    endif
    return cmd
endfunction

function SlimeSetwd()
    if &filetype == 'rmd'
        let cmd = Setwd(g:chunk_language)
    else
        let cmd = Setwd(&filetype)
    endif
    call slime#send(cmd . "\n")
endfunction

function Setwd(lang, ...)
    let wd_new = expand("%:p:h")
    let wd_new = get(a:, 1, wd_new) " for optional new working directory
    let wd_new = substitute(wd_new, expand('~'), '~', '')
    if a:lang == 'r'
        let cmd = 'setwd("' . wd_new . '")'
    elseif a:lang == 'julia'
        let wd_new = substitute(wd_new, '\~', '$(homedir())', '')
        let cmd = 'cd("' . wd_new . '")'
    else
        let cmd = "cd " . wd_new
    endif
    return cmd
endfunction

function GitPath()
    let path_file = expand("%:p")
    let path_file = substitute(path_file, expand('~'), '~', '')
    let path_head = fnamemodify(path_file, ":h")
    let path_git = system('git -C ' . path_head . ' rev-parse --show-toplevel')
    let path_git = split(path_git, "\n")[0]
    return path_git
endfunction

function SlimeGitwd()
    let path_git = GitPath()
    if &filetype == 'rmd'
        let cmd = Setwd(g:chunk_language, path_git)
    else
        let cmd = Setwd(&filetype, path_git)
    endif
    call slime#send(cmd . "\n")
endfunction

function SlimeHelpSend()
    if &filetype == 'rmd'
        let cmd = HelpSend(g:chunk_language)
    else
        let cmd = HelpSend(&filetype)
    endif
    call slime#send(cmd . "\n")
endfunction

function HelpSend(lang)
    let object = expand("<cword>")
    if a:lang == "r"
        let cmd = '?'
    elseif a:lang == "julia"
        let cmd = '?'
    endif
    return cmd . object
endfunction

function SlimePrintSend()
    let object = expand("<cword>")
    call slime#send(object . "\n")
endfunction

function SlimeStructureSend()
    if &filetype == 'rmd'
        let cmd = StructureSend(g:chunk_language)
    else
        let cmd = StructureSend(&filetype)
    endif
    call slime#send(cmd . "\n")
endfunction

function StructureSend(lang)
    let object = expand("<cword>")
    if a:lang == "r"
        let cmd = 'str'
    elseif a:lang == "julia"
        let cmd = "dump"
    endif
    return cmd . '(' . object . ')'
endfunction

function SlimeQuitSend()
    if &filetype == 'rmd'
        let cmd = QuitSend(g:chunk_language)
    else
        let cmd = QuitSend(&filetype)
    endif
    call slime#send(cmd . "\n")
endfunction

function QuitSend(lang)
    if a:lang == "r"
        let cmd = 'quit()'
    elseif &filetype == "julia"
        let cmd = 'exit()'
    endif
    return cmd
endfunction

function SlimeExitSend()
    let cmd = 'exit'
    call slime#send(cmd . "\n")
endfunction

function SlimeMakeSend()
    " if &filetype == 'r'
    "     let cmd = "reprodown::makefile(); system('make')\n"
    " elseif &filetypm == 'rmd'
    "     let cmd = "reprodown::makefile(); system('make')\n"
    " endif
    let cmd = "reprodown::makefile(); system('make')\n"
    call slime#send(cmd)
endfunction

function SlimeMakeSendTar()
    let cmd = "reprodown::makefile(test = 'tar'); system('make')\n"
    call slime#send(cmd)
endfunction

function SlimeMakeSendPre()
    let cmd = "reprodown::makefile(test = 'pre'); system('make')\n"
    call slime#send(cmd)
endfunction

function SlimeMakeSendBoth()
    let cmd = "reprodown::makefile(test = c('pre', 'tar')); system('make')\n"
    call slime#send(cmd)
endfunction

" let g:slime_target = "neovim"
let g:slime_target = "tmux"
let g:slime_no_mappings = 1
let g:slime_cell_delimiter = "#%%"
nmap <leader>rf <Plug>SlimeConfig
" basic commands
nmap <silent> <leader>rq :call SlimeQuitSend()<CR>
nmap <silent> <leader>re :call SlimeExitSend()<CR>
nmap <silent> <leader>rm :call SlimeMakeSend()<CR>
nmap <silent> <leader>rh :call SlimeHelpSend()<CR>
nmap <silent> <leader>rp :call SlimePrintSend()<CR>
nmap <silent> <leader>rt :call SlimeStructureSend()<CR>
" firefox integration
nmap <leader>fo :call FirefoxOpen()<CR>
nmap <leader>fs :call FirefoxUpdateSync()<CR>
nmap <leader>fk :call FirefoxUpdateKill()<CR>
" working directory
nmap <silent> <leader>pwd :call SlimeGetwd()<CR>
nmap <silent> <leader>cd :call SlimeSetwd()<CR>
nmap <silent> <leader>cg :call SlimeGitwd()<CR>
" send code
nmap <leader>ll <Plug>SlimeLineSend
nmap <leader>pp <Plug>SlimeParagraphSend
xmap <leader>ss <Plug>SlimeRegionSend
nmap <leader>ss <Plug>SlimeMotionSend
nmap <leader>cc \ssac
nmap <leader>hh \ssgg
" nmap <leader>ff <Plug>SlimeFunctionSend
nmap <leader>bb ['\ss]'<C-o>
" nmap <leader>bb <Plug>SlimeSendCell
" run, render or serve
nmap <leader>aa :call SlimeAllSend()<CR>
nmap <leader>ab :call SlimeAllSendB()<CR>
nmap <leader>vv :call SlimeServeSend()<CR>
nmap <leader>vh :call SlimeHugoSend()<CR>

