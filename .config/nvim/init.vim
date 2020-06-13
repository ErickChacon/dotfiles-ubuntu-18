" Neovim settings
"
" Maintainer:	Erick Chacón
" Last Change:	2020 May 6

" minimal
so ~/.config/nvim/init/plugins.vim
so ~/.config/nvim/init/config.vim
so ~/.config/nvim/init/folding.vim

" aesthetics
so ~/.config/nvim/init/colors.vim
so ~/.config/nvim/init/statusline.vim

" ide features
so ~/.config/nvim/init/navigation.vim
so ~/.config/nvim/init/languageserver.vim
so ~/.config/nvim/init/completion.vim
so ~/.config/nvim/init/snippets.vim

" languages
so ~/.config/nvim/init/r.vim
so ~/.config/nvim/init/markdown.vim

" others
so ~/.config/nvim/init/easyalign.vim
so ~/.config/nvim/init/wiki.vim

" function StartDocker()
"     let bclapp = b:cmdline_app
"     if &filetype == "python"
"         let b:cmdline_app = "docker exec -it container /usr/python3"
"     elseif &filetype == "ruby"
"         let b:cmdline_app = "docker exec -it container /usr/irb"
"     endif
"     call VimCmdLineStartApp()
"     let b:cmdline_app = bclapp
" endfunction

" nmap <LocalLeader>d :call StartDocker()<CR>
