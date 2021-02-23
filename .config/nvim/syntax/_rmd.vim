" quit when a syntax file was already loaded
if exists("b:current_syntax")
  finish
endif

" Read the C syntax to start with
runtime! /home/chaconmo/.config/nvim/after/syntax/markdown.vim

let b:current_syntax = "rmd"

" unlet b:current_syntax

" let b:current_syntax = "rmd"

" syn include @texMathZones syntax/tex.vim
" " syn region mdMathZoneX start="\$" end="\$" keepend contains=@texMathZones
" " containedin=Normal
" syn region mdMathZoneA start="^\\begin{\w\+}" end="^\\end{\w\+}$" keepend contains=@texMathZones
" " containedin=Normal
" " highlight link mdMathZoneX texMathZones
" highlight link mdMathZoneA Comment
