
" testitexn"
" Neovim settings
" Language:	Vim
" Last Change:	07 Jun 2018

call plug#begin('~/.local/share/nvim/plugged')

" Colorschemes
Plug 'morhetz/gruvbox'
Plug 'sickill/vim-monokai'
Plug 'ajh17/Spacegray.vim'
Plug 'icymind/NeoSolarized'
Plug 'mhartington/oceanic-next'
Plug 'KeitaNakamura/neodark.vim'
Plug 'arcticicestudio/nord-vim'
" Plug 'MaxSt/FlatColor'
Plug 'challenger-deep-theme/vim', { 'as': 'challenger-deep' }
Plug 'joshdick/onedark.vim'
Plug 'nightsense/vim-crunchbang'
Plug 'exitface/synthwave.vim'
Plug 'YorickPeterse/happy_hacking.vim'
Plug 'gilgigilgil/anderson.vim'
Plug 'jdkanani/vim-material-theme'
Plug 'jeetsukumaran/vim-nefertiti'
Plug 'dracula/vim'
Plug 'mhinz/vim-janah'
Plug 'jdsimcoe/abstract.vim'
Plug 'AlessandroYorba/Alduin'
Plug 'zacanger/angr.vim'
Plug 'tyrannicaltoucan/vim-deep-space'
Plug 'w0ng/vim-hybrid'
Plug 'nanotech/jellybeans.vim'
Plug 'cseelus/vim-colors-lucid'
Plug 'rakr/vim-one'
Plug 'liuchengxu/space-vim-dark'
Plug 'jacoborus/tender.vim'
Plug 'rakr/vim-two-firewatch'
Plug 'roosta/srcery'
Plug 'nightsense/stellarized'
Plug 'ajmwagar/vim-deus'
Plug 'sonph/onehalf', {'rtp': 'vim/'}
Plug 'chriskempson/base16-vim'
Plug 'chriskempson/tomorrow-theme', {'rtp': 'vim/'}

" Explore folder and documents
Plug 'ctrlpvim/ctrlp.vim' " find files
Plug 'scrooloose/nerdtree' " explore your filesystem and to open files
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim' " fuzzy matching

" Development environment tools
" Plug 'epeli/slimux' " not using with r but maybe with python
" Plug 'kassio/neoterm' " use terminal
Plug 'jalvesaq/vimcmdline' " command line
Plug 'hkupty/iron.nvim' " Interactive Repls Over Neovim
Plug 'SirVer/ultisnips' " snippets
Plug 'honza/vim-snippets' " snippets scripts
" Plug 'roxma/nvim-completion-manager'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' } " completion
" Plug 'autozimu/LanguageClient-neovim', {
"     \ 'branch': 'next',
"     \ 'do': 'bash install.sh',
"     \ }

if !exists("g:gui_oni")
  " Plug 'vim-airline/vim-airline' " status and tab lines
  " Plug 'vim-airline/vim-airline-themes'
endif
Plug 'itchyny/lightline.vim' " status and tab lines
Plug 'ryanoasis/vim-devicons' " filetype icons
Plug 'kshenoy/vim-signature' " display marks
Plug 'majutsushi/tagbar' " display tags
Plug 'ap/vim-css-color'
Plug 'ntpeters/vim-better-whitespace'
" Plug 'edkolev/tmuxline.vim'
" Plug 'weihanglo/tmuxline.vim'
Plug 'CPWeaver/tmuxline.vim'
Plug 'christoomey/vim-tmux-navigator'

" Programs
Plug 'vimwiki/vimwiki' " vimwiki: notes and agenda
Plug 'lervag/vimtex' " latex
" Plug 'vim-pandoc/vim-pandoc-syntax' " markdown: great works with nvim-r
Plug 'ErickChacon/vim-pandoc-syntax' " markdown: great works with nvim-r
Plug 'vim-pandoc/vim-pandoc' " markdown: really nice for markdown
function! BuildComposer(info) " markdown preview
  if a:info.status != 'unchanged' || a:info.force
    !cargo build --release
  endif
endfunction
Plug 'euclio/vim-markdown-composer', { 'do': function('BuildComposer') }
Plug 'cespare/vim-toml' " toml: syntax highlight
Plug 'jalvesaq/Nvim-R' " R: run code, rmarkdown, help and more
Plug 'tpope/vim-fugitive' " git: wrapper
Plug 'airblade/vim-gitgutter' " git: shows added and remove lines of git
Plug 'mhinz/vim-signify'
" Plug 'ivanov/vim-ipython' " Python: two-way integration with ipython
" Plug 'bfredl/nvim-ipy' " Python: jupyter front-end for neovim
" Plug 'zchee/deoplete-jedi' " Python: autocomplete
Plug 'vim-python/python-syntax' " Python: syntax highlighting
" Plug 'coyotebush/vim-pweave'
" Plug 'KeitaNakamura/highlighter.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'JuliaEditorSupport/julia-vim'
" Plug 'JuliaEditorSupport/deoplete-julia' " initialize problem
" Plug 'mattpenney89/vimify' " Spotify
" Plug 'HendrikPetertje/vimify' " Spotify

" Motions
Plug 'tpope/vim-surround' " sorround
Plug 'kana/vim-textobj-indent' " copy indented block
Plug 'kana/vim-textobj-user' " custom text object
" Plug 'tpope/vim-commentary' " easy comment and uncomment: slow for rmd
Plug 'tomtom/tcomment_vim' " easy comment: nice for rmd
" Plug 'scrooloose/nerdcommenter'
Plug 'godlygeek/tabular'

" Terminal file manager
" Plug 'francoiscabrol/ranger.vim'
" Plug 'rbgrouleff/bclose.vim'

call plug#end()
