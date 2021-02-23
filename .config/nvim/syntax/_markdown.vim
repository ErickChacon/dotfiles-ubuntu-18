" " " quit when a syntax file was already loaded
" if exists("b:current_syntax")
"   finish
" endif


" syn include @texMathZones syntax/tex.vim
"
" syn region mdMathZoneX start="\$" end="\$" keepend contains=@texMathZones
" syn region mdMathZoneA start="^\\begin{\w\+}" end="^\\end{\w\+}$" keepend contains=@texMathZones
"
" let b:current_syntax = "markdown"

" syn include @texMathZones syntax/tex.vim
" syn region mdMathZoneX start="\$" end="\$" keepend contains=@texMathZones containedin=Normal

syn include @texMathZones syntax/tex.vim
" syn region mdMathZoneX start="\$" end="\$" keepend contains=@texMathZones
" containedin=Normal
syn region mdMathZoneA start="^\\begin{\w\+}" end="^\\end{\w\+}$" keepend contains=@texMathZones
" containedin=Normal
" highlight link mdMathZoneX texMathZones
highlight link mdMathZoneA Comment
