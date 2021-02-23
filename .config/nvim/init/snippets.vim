" Variables
let g:neosnippet#disable_runtime_snippets = {'_' : 1}
let g:neosnippet#snippets_directory=[
            \ '~/.local/share/nvim/plugged/vim-snippets/snippets',
            \ '~/Documents/Repositories/dotfiles-ubuntu-18/neosnippets']
let g:neosnippet#scope_aliases = {}
let g:neosnippet#scope_aliases['rmd'] = 'markdown,rmd,tex'

" Mapping
imap <C-L>     <Plug>(neosnippet_expand_or_jump)
smap <C-L>     <Plug>(neosnippet_expand_or_jump)
xmap <C-L>     <Plug>(neosnippet_expand_target)

" Function and command to add snippets of a language
function NeoSnippetAdd(language)
    for dir_exe in g:neosnippet#snippets_directory
        let file_exe = dir_exe . "/" . a:language . ".snippets"
        if filereadable(expand(file_exe))
            execute("NeoSnippetSource " . file_exe)
        endif
    endfor
endfunction

command! -nargs=1 NeoSnippetAdd
      \ call NeoSnippetAdd(<f-args>)
