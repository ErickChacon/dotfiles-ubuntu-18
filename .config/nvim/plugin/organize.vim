if exists("g:loaded_notes")
    finish
endif
let g:loaded_notes =1

function Sanitize(path)
    let fullpath = a:path

    if fullpath =~ '^\.\/'
        let fullpath = substitute(fullpath, '^\.\/', "", "")
    endif

    if fullpath =~? '^[0-9a-z]'
        let folder = expand('%:p:h')
        let fullpath = join([folder, fullpath], '/')
    elseif fullpath =~ '^\.\.\/'
        let folder = expand('%:p:h:h')
        let fullpath = substitute(fullpath, '^\.\.\/', "", "")
        let fullpath = join([folder, fullpath], '/')
    endif

    return fullpath
endfunction

function Makedir(path)
    let filepath = a:path
    let folder = fnamemodify(filepath, ':p:h')
    if !isdirectory(folder)
        if input("Create directory: ".folder."\n [y]es/[N]o? ") !~? '^y'
            return 0
        endif
        call mkdir(folder, "p")
    endif
    return 1
endfunction

function Gofile()
    let path = Sanitize(expand('<cfile>'))
    if 1 == Makedir(path)
        :execute 'edit' path
    end
endfunction

function Organize(root_path, ...)
    let index_file = get(a:, 1, 'index.md')
    let path = a:root_path . '/' . index_file
    echo path
    if 1 == Makedir(path)
        :execute 'edit' path
    end
endfunction

let g:org_root = '~/Documents/Organizer'
let g:org_academic = g:org_root . '/academic'
let g:org_personal = g:org_root . '/personal'
let g:org_todo = g:org_root . '/todo'
let g:org_write = g:org_root . '/writing'

command! Organize
      \ call Organize(g:org_root)

command! Academic
      \ call Organize(g:org_academic)

command! Personal
      \ call Organize(g:org_personal)

command! Writing
      \ call Organize(g:org_write)

command! Todo
      \ call Organize(g:org_todo)

command! Daily
      \ call Organize(g:org_todo, "daily.md")

" nnoremap <unique><script> <Plug>Organizer :Organize<CR>
" nnoremap <unique><script> <Plug>gff :call Gofile()<CR>

" nmap <silent> <leader>wo <Plug>Organizer
" nmap <silent> <leader>wa :call Organize(g:org_academic)<CR>
" nmap <silent> <leader>wp :call Organize(g:org_personal)<CR>
" nmap <silent> <leader>wt :call Organize(g:org_todo)<CR>
" nmap <silent> <leader>wd :call Organize(g:org_todo, "daily.md")<CR>
" nmap <silent> <leader>wf :call Organize(g:org_todo, "daily.md")<CR>
nmap <silent> fg :call Gofile() <CR>
