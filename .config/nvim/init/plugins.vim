call plug#begin('~/.local/share/nvim/plugged')


" Aesthetics
Plug 'edkolev/tmuxline.vim'            , {'commit': '1142333'}  " tmux statusline
Plug 'kshenoy/vim-signature'           , {'commit': '6bc3dd1'}  " display marks
Plug 'mhinz/vim-signify'               , {'commit': 'f34fea0'}  " display diff
Plug 'ntpeters/vim-better-whitespace'  , {'commit': 'f5726c4'}  " trailing space
Plug 'ap/vim-css-color'                , {'commit': '5a31c72'}  " TODO: closes rmd chunk

" Ide features
Plug 'scrooloose/nerdtree'             , {'commit': '67fa9b3'}  " file navigator
Plug 'ton/vim-bufsurf'                 , {'commit': 'e93829b'}  " buffer navigator
Plug 'christoomey/vim-tmux-navigator'  , {'commit': '4e1a877'}  " tmux-vim navigation
Plug 'junegunn/fzf'                    , {'commit': '430e819',
            \ 'dir': '~/.fzf', 'do': './install --all'}
Plug 'junegunn/fzf.vim'                , {'commit': 'ac4e7bf'}  " fuzzy matching
Plug 'autozimu/LanguageClient-neovim'  , {'commit': '4b35f5d',
            \ 'branch': 'next', 'do': 'bash install.sh'}        " language server
Plug 'Shougo/deoplete.nvim'            , {'commit': 'a76d2fb',
            \ 'do': ':UpdateRemotePlugins' }                    " completion
Plug 'tomtom/tcomment_vim'             , {'commit': '622cc05'}  " commenting
Plug 'Shougo/neosnippet.vim'           , {'commit': '23c9743'}  " snippets
Plug 'honza/vim-snippets'              , {'commit': '7ade68c'}  " snippets scripts
Plug 'jalvesaq/vimcmdline'
" Plug 'hkupty/iron.nvim'                , {'commit': 'c3542c2'}  " repls over neovim
Plug 'tpope/vim-fugitive'              , {'commit': '5d99841'}  " git commands

" Languages
Plug 'lervag/vimtex'                   , {'commit': 'ef428bb'}  " latex: compile
Plug 'cespare/vim-toml'                , {'commit': '2295e61'}  " toml: syntax
" Plug 'jalvesaq/Nvim-R'
" Plug 'jalvesaq/Nvim-R'                 , {'commit': '7a551bd'}  " R: support
" Plug 'jalvesaq/Nvim-R'                 , {'commit': '9ab1ead'}  " R: support
" Plug 'vim-python/python-syntax'                          " python: better syntax
" Plug 'octol/vim-cpp-enhanced-highlight'                  " cpp: better syntax
Plug 'JuliaEditorSupport/julia-vim'                      " julia: support
" Plug 'kassio/neoterm'
Plug 'jpalardy/vim-slime'

" Motions
Plug 'junegunn/vim-easy-align'         , {'commit': '12dd631'}  " align
Plug 'tpope/vim-surround'              , {'commit': 'ca58a2d'}  " sorround
" Plug 'kana/vim-textobj-indent'         , {'commit': 'deb7686'}  " copy indented block
" Plug 'kana/vim-textobj-user'           , {'commit': '074ce25'}  " custom text object

" Note taking
Plug 'lervag/wiki.vim'                 , {'commit': '92734dc'}  " make notes
Plug 'dkarter/bullets.vim'             , {'commit': 'c9f915e'}  " smart bullets

" Colorschemes
Plug 'morhetz/gruvbox'                 , {'commit': 'cb4e7a5'}
" Plug 'sickill/vim-monokai'             , {'commit': 'ae77538'}
" Plug 'ajh17/Spacegray.vim'             , {'commit': '69e8fef'}
" Plug 'icymind/NeoSolarized'            , {'commit': '1af4bf6'}
" Plug 'mhartington/oceanic-next'        , {'commit': '08158ee'}
" Plug 'KeitaNakamura/neodark.vim'       , {'commit': 'e95e924'}
" Plug 'arcticicestudio/nord-vim'        , {'commit': 'de24841'}
" Plug 'challenger-deep-theme/vim'       , {'commit': '927720e', 'as': 'challenger-deep' }
" Plug 'joshdick/onedark.vim'            , {'commit': '7f36f83'}
" Plug 'nightsense/vim-crunchbang'       , {'commit': '448e75e'}
" Plug 'exitface/synthwave.vim'          , {'commit': 'a19772b'}
" Plug 'jdkanani/vim-material-theme'     , {'commit': '33bd4bf'}
" Plug 'dracula/vim'                     , {'commit': 'b68c4fd'}
" Plug 'mhinz/vim-janah'                 , {'commit': '3b8ae97'}
" Plug 'jdsimcoe/abstract.vim'           , {'commit': '16d0131'}
" Plug 'AlessandroYorba/Alduin'          , {'commit': '379418b'}
" Plug 'tyrannicaltoucan/vim-deep-space' , {'commit': '126d52f'}
" Plug 'w0ng/vim-hybrid'                 , {'commit': 'cc58baa'}
" Plug 'nanotech/jellybeans.vim'         , {'commit': 'ddf78cf'}
" Plug 'cseelus/vim-colors-lucid'        , {'commit': 'a2bc8f6'}
" Plug 'rakr/vim-one'                    , {'commit': '6695e13'}
" Plug 'liuchengxu/space-vim-dark'       , {'commit': 'f707a39'}
" Plug 'jacoborus/tender.vim'            , {'commit': '6b0497a'}
" Plug 'rakr/vim-two-firewatch'          , {'commit': 'efa0689'}
" Plug 'ajmwagar/vim-deus'               , {'commit': 'c6200a1'}
" Plug 'sonph/onehalf'                   , {'commit': 'c0f08a2', 'rtp': 'vim/'}
" Plug 'chriskempson/base16-vim'         , {'commit': '6191622'}
" Plug 'chriskempson/tomorrow-theme'     , {'commit': '0e0d35a', 'rtp': 'vim/'}

call plug#end()
" up
"
" let g:slime_target = "neovim"
let g:slime_target = "tmux"
" let g:slime
" xmap <leader>ss <Plug>SlimeRegionSend
" nmap <leader>ss <Plug>SlimeParagraphSend
" xmap <leader>s <Plug>SlimeRegionSend
nmap <leader>ss <Plug>SlimeMotionSend
" nmap <leader>ss <Plug>SlimeLineSend

" " let g:neoterm_repl_python = 'python3'
" let g:neoterm_default_mod = "belowright"
" let g:neoterm_direct_open_repl = 1
" nmap gx <Plug>(neoterm-repl-send)

" docker-compose -f ~/Documents/Repositories/dotfiles-ubuntu-18/toolbox/docker-compose.yml run --rm python bash
" docker-compose -f ~/Documents/Repositories/dotfiles-ubuntu-18/toolbox/docker-compose.yml run --rm geospatial bash

" docker exec -it " . container . " python"
"
" docker-compose -f ~/Documents/Repositories/dotfiles-ubuntu-18/toolbox/docker-compose.yml run --name python_run --detach --rm python bash
" docker exec -ti python_run bash
" --name python_run 
" docker exec -ti toolbox_python_1 bash
"

" " let R_app = 'docker'
" " let R_app = 'docker'
" let $NVIM_IP_ADDRESS = substitute(system("hostname -I"), " .*", "", "")
" let R_app = 'docker exec -it global-docker R'
" let R_cmd = 'docker exec global-docker R'
" let R_compldir = '~/.remoteR/NvimR_cache'
" " let R_tmpdir = '/tmp/Nvim-R'
" " let R_remote_tmpdir = '/tmp/Nvim-R-rstudio'
" let R_nvimcom_home = '/home/chaconmo/.remoteR/R_library/nvimcom'
" let R_nvim_wd = 1
" " let R_tmpdir = '~/.remoteR/NvimR_cache/tmp'
" " let R_remote_tmpdir = '/home/rstudio/.cache/NvimR_cache/tmp'
" " let R_tmpdir = 'tmp/Nvim-R-tmp'
" " let R_compldir = '/home/rstudio/.cache/Nvim-R'
" " let R_compldir = '/tmp/Nvim-R-tmp/.cache'
" " let R_cmd = 'docker exec -it global-docker R'
" " let R_args = ['exec -it global-docker R']
"
" " let R_cmd = 'exec -it global-docker R'
" "  
"
" " let R_args =['run -it --rm', '-e DISPLAY=$DISPLAY', '-v /tmp/.X11-unix:/tmp/.X11-unix:ro', '--ipc host my-r-image']
" " let R_args = ['exec -it global-docker R']
"
" " 1) Fi
