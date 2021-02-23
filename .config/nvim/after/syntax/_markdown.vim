" Vim after syntax file
" Language:     Markdown
" Maintainer:   Erick A. Chacón Montalván
" Filenames:    *.markdown
" Last Change:  2020 Dec 16

if exists('b:current_syntax')
    let s:current_syntax=b:current_syntax
    unlet b:current_syntax
endi

" LATEX
" syn include @texMathZones syntax/tex.vim
syn include @texRefZone @texMathZones syntax/tex.vim
" syn include syntax/tex.vim
if exists('s:current_syntax')
    let b:current_syntax=s:current_syntax
  else
    unlet b:current_syntax
endif
" math zones
syn region mdMathZoneX start="\$" end="\$" keepend contains=@texMathZones
syn region mdMathZoneA start="^\\begin{\w\+}" end="^\\end{\w\+}$" keepend contains=@texMathZones
" references zones
syn match mdRefZone "\\ref{[0-9A-Za-z_:]\+}" keepend contains=@texRefZone
syn match mdRefZone "\\\(nocite\|cite[p-t]\?\){\w\+}" keepend contains=@texRefZone

" YAML
if b:current_syntax == "markdown"
    syn region mdYaml start="^---$" end="^---$"
    hi! link mdYaml Comment
endif
