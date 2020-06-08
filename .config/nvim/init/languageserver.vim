
" set hidden
let g:LanguageClient_serverCommands = {
    \ 'rust': ['rustup', 'run', 'stable', 'rls'],
    \ 'javascript': ['javascript-typescript-stdio'],
    \ 'javascript.jsx': ['javascript-typescript-stdio'],
    \ 'cpp': ['clangd'],
    \ 'python': ['pyls'],
    "\ 'r': ['R', '--slave', '-e', 'languageserver::run()'],
    \ 'r': ['R', '--quiet', '--slave', '-e', 'languageserver::run()'],
    \ 'rmd': ['R', '--quiet', '--slave', '-e', 'languageserver::run()'],
    \ }

let g:LanguageClient_autoStart = 0

" let g:LanguageClient_serverCommands = {}
" let g:LanguageClient_loggingFile = expand('/tmp/LanguageClient.log')
" let g:LanguageClient_loggingLevel = 'DEBUG'
" let g:LanguageClient_serverCommands.r = ['R', '--quiet', '--slave', '-e', 'languageserver::run(debug = TRUE)']
