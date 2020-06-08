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
" Plug 'jalvesaq/vimcmdline'             , {'commit': '17275ab'}  " command line
" Plug 'hkupty/iron.nvim'                , {'commit': 'c3542c2'}  " repls over neovim
Plug 'tpope/vim-fugitive'              , {'commit': '5d99841'}  " git commands

" Languages
Plug 'lervag/vimtex'                   , {'commit': 'ef428bb'}  " latex: compile
Plug 'cespare/vim-toml'                , {'commit': '2295e61'}  " toml: syntax
" Plug 'jalvesaq/Nvim-R'                 , {'commit': '7a551bd'}  " R: support
Plug 'jalvesaq/Nvim-R'                 , {'commit': '9ab1ead'}  " R: support
" Plug 'vim-python/python-syntax'                          " python: better syntax
" Plug 'octol/vim-cpp-enhanced-highlight'                  " cpp: better syntax
" Plug 'JuliaEditorSupport/julia-vim'                      " julia: support

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
