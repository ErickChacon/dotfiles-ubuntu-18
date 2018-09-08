"  Example with contains and contained
syntax keyword plop plop containedin=texComment
hi! link plop GruvboxBlueBold
" syn match texSectioningCommand '\\begin\>\|\\end\>' contains=@texSectioningGroup
" syn match texSectioningCommand '\\begin{document}' contains=texSectioningGroup
" syn match texSectioningCommand '\\section\>' containedin=texChapterGroup
" syn match texSectioningCommand '\\begin\|\\end' contains=texSectioningGroup
" syn match texSectioningCommand '\\begin\>\|\\end\>' nextgroup=texSectioningTitle
" This is working great!!!!!!!!!!!!!!!!!!!!!!
" syn match texSectioningCommand '\\begin\>\|\\end\>' containedin=ALL nextgroup=texBegName
" syn region texBegName matchgroup=Delimiter start="{" end="}" contained
" hi! link texSectioningCommand GruvboxPurpleBold
" hi! link texBegName GruvboxPurpleBold
syn match texSectioningCommand '\\section\>' containedin=ALLBUT,texComment
" syn match texSectioningCommand '\\section\>' containedin=@texPreambleMatchGroup
" syn match texSectioningCommand '^\\section\>' containedin=@texPreambleMatchGroup contains=
" nextgroup=texBegName
" syn region texBegName matchgroup=Delimiter start="{" end="}" contained
" hi! link texSectioningCommand GruvboxPurpleBold
hi texSectioningCommand guifg=#ec5f67 ctermfg=203
" hi! link texPreamble GruvboxPurpleBold
" hi! link texBegName GruvboxPurpleBold
" texBeginEnd
" nextgroup=texSectioningTitle
" contained
" syn region texSectioningTitle        start='{'  end='}' contained contains=texSectioningName
" syn region texSectioningName matchgroup=texSectioningTitle        start='{'  end='}' contained

" contains=texSectioningGroup
" syn cluster texSectioningGroup contains=texSectioningCommand
" syn cluster texChapterGroup contains=@texSectioningGroup
" syn cluster texChapterGroup contains=texSectioningCommand
" syn cluster texSection contains=texSectioningCommand
" syn cluster texSection add=texSectioningCommand
" syn cluster texChapterGroup contains=@texSectioningGroup
" hi! link texSectioningCommand GruvboxPurpleBold
" hi! link texBegName GruvboxPurpleBold
" hi! link texSectioningName GruvboxRed
" syn match texSectioningCommand '\\begin\>\|\\end\>' skipwhite     nextgroup=texSectioningTitle contains=@texSectioningGroup
" syn region texSectioningTitle        start='{'  end='}' contained
" syn cluster texSectioningGroup contains=texSectioningCommand
" syn cluster texChapterGroup contains=@texSectioningGroup
" " syn cluster texChapterGroup contains=@texSectioningGroup
" hi! link texSectioningCommand GruvboxPurpleBold
" hi! link texSectioningTitle GruvboxYellowBold
" " syn region texAbstract1	matchgroup=texSection start='\\abstract\>\s*{' end='}'	contains=@texFoldGroup,@Spell
" hi! link texAbstract1 GruvboxPurpleBold
" syn match plop "[a-z]" containedin=ALL
" " " syn match plop "[a-z]" containedin=texSection
" hi! link plop GruvboxPurpleBold
"
"  Example with contains and contained
"  syntax keyword Todo    TODO  contained
" "  hi! link Todo GruvboxBlueBold
"  syntax match toComment "//.*"  contains=Todo
"  hi! link toComment GruvboxBlue

" Example with nextgroup and skipwhite
" syn match myId '\w\+' contained
" hi! link myId GruvboxBlue
" syn keyword myType void int bool string list nextgroup=myId skipwhite
" hi! link myType GruvboxPurple

" " Example with matchgroup
" " syntax region potionString start=/\v"/ skip=/\v\\./ end=/\v"/
" syntax region potionString start="h" end="d"
" hi! link potionString GruvboxYellow
" " syntax region plop matchgroup=potionString start=+o+ skip=+\\"+ end=+a+
" syntax region plop matchgroup=potionString start=+h+ end=+d+



" hi! link plop GruvboxRed
" " Example with
" syn region plopBeginEndName matchgroup=Delimiter start="{" end="}" contained
" " nextgroup=texBeginEndModifier	contains=texComment
" hi! link texBeginEndName GruvboxPurpleBold
" hi plopBeginEndName guifg=#ec5f67 ctermfg=203

" syntax region potionString start=/\v"/ skip=/\v\\./ end=/\v"/
" " syntax region potionString start=/\v"/ end=/\v"/
" highlight link potionString GruvboxRedBold

" Trying to macth existant syntax
" hi! link texDocType GruvboxYellow
" syntax match plop "\\author"
" contains=texDocType
" highlight link texDocZone GruvboxPurpleBold
" syntax region plop start="\\" end="\>" matchgroup=texDocType
" hi! link potionString GruvboxYellow
" syntax match plop "section" containedin=ALL
" hi! link plop GruvboxBlueBold
" syn clear texBeginEndName
" " syn region ertexBeginEndName		matchgroup=Delimiter	start="{"		end="}"	nextgroup=texBeginEndModifier containedin=ALL
" syn region ertexBeginEndName		matchgroup=Delimiter	start="{"		end="}"	nextgroup=texBeginEndModifier containedin=ALL
" " contains=texComment
" hi! link ertexBeginEndName GruvboxYellowBold " names insido doc
" syn match  plop2 "document" nextgroup=texBeginEnd
" syn match  plop "\\begin\>\|\\end\>"
" nextgroup=texBeginEnd
" " nextgroup=texBeginEndName
" hi! link plop GruvboxYellowBold
" hi! link plop2 GruvboxBlueBold
" " " syn match plop "\v\{.+\}" nextgroup=texTitle
" " " syn match plop "e" nextgroup=texTitle
" " syn region plop1 start="h" end="o"
" " syn region plop2 start="h" end="a"
" hi! link plop1 GruvboxYellowBold
" hi! link plop2 GruvboxGreen
"
"
" " " Match syntax
" " " syn match rFunction "\v(\w|\.)+\(&(\w|\.)+"
" " " hi! link rFunction GruvboxAqua
" "
" " " Gruvbox colors
" " hi! link texDocType GruvboxBlue " documentclass
" " hi! link texDocTypeArgs GruvboxBlue "docclass args
" " hi! link texInputFile GruvboxBlue " packages, graphs
" " " hi! link texBeginEnd GruvboxBlue " begin, end
" " hi! link texPreamble GruvboxBlue " begin, end
" " hi! link texTitle GruvboxBlue "inside title, author
" " hi! link texAbstract GruvboxBlue "inside abtsract
" " hi! link texDocZone GruvboxBlue "inside abtsract
" hi! link texSection GruvboxYellowBold "inside abtsract
" " hi! link texSectionZone GruvboxRedBold "inside abtsract
" " hi! link texParaZone GruvboxBlueBold "inside abtsract
" " hi! link texZone GruvboxBlueBold "inside abtsract
" " " hi! link rSpecial GruvboxRed
" " hi! link texStatement GruvboxPurple " most commasnd
" " hi! link texRefZone GruvboxPurple " references
" " hi! link texBeginEnd GruvboxBlueBold " begin, end, envir
" hi! link texBeginEndName GruvboxBlueBold " envir name
" " hi! link texBeginEndModifier GruvboxBlueBold " envir name
" " " hi! link rRepeat GruvboxBlueBold
" " hi! link texMath GruvboxBlueBold
" " hi! link texMathOper GruvboxBlueBold
" " hi! link texMathDelim GruvboxGreen
" " hi! link texMathText GruvboxGreen
" " " hi! link texOper GruvboxGreen
" " " hi! link texSpecialChar GruvboxGreen
" " " hi! link tex GruvboxGreen
" " hi! link texMathSymbol GruvboxBlue
" " " hi! link texMathMatcher GruvboxRed " not sure
" " hi! link texSuperscript GruvboxRed
" " hi! link texSubscript GruvboxAqua
" " " hi! link texGreek GruvboxRed
" " " hi! link Special GruvboxBlueBold
" " hi! link texInputFile GruvboxBlueBold
" " " hi! link texSpecialChar GruvboxRedBold
" " hi! link texDelimiter GruvboxBlue
" " hi! link texTypeSize GruvboxBlue
" " " hi! link rFloat GruvboxRed
" " " hi! link rComplex GruvboxRed
" " " hi! link rAssign GruvboxRedBold
" " " hi! link rOperator GruvboxRed
" " " hi! link rOpError GruvboxRed
" " " hi! link rDelimiter GruvboxRed
" " " hi! link rError GruvboxRed
" " " hi! link rBraceError GruvboxRed
" " " hi! link rCurlyError GruvboxRed
" " " hi! link rParenError GruvboxRed
" " " hi! link rDollar GruvboxRed
" " " hi! link rLstElmt GruvboxRed
" " " hi! link rType GruvboxRed
" "
" " " hi rComment guifg=#ec5f67 ctermfg=203
" " " hi rSpecial guifg=#ec5f67 ctermfg=203 " unicode characters
" " " hi rStatement guifg=#65737e ctermfg=203 " break next return
" " " hi rConditional guifg=#65737e ctermfg=203 " if else
" " " hi rRepeat guifg=#65737e ctermfg=203 " for in repeat while
" " " hi rConstant guifg=#65737e ctermfg=203 " T, F, letters, NULL, pi
" " " hi rBoolean guifg=#65737e ctermfg=203
" " " hi rNumber guifg=#65737e ctermfg=203 ", NA. Inf, NaN, numbers
" " " hi rInteger guifg=#65737e ctermfg=203 ", NA. Inf, NaN
" " " hi rFloat guifg=#65737e ctermfg=203 ", NA. Inf, NaN
" " " hi rComplex guifg=#65737e ctermfg=203 ", NA. Inf, NaN
" " " hi rAssign guifg=#65737e ctermfg=203 " =, <-, ->
" " " hi rOperator guifg=#65737e ctermfg=203 " & - *
" " " hi rOpError guifg=#65737e ctermfg=203 " >>, <<, |||
" " " hi rDelimiter guifg=#65737e ctermfg=203 "[,;:]
" " " hi rError guifg=#65737e ctermfg=203 " [)\]}]
" " " hi rBraceError guifg=#65737e ctermfg=203 "[)}]
" " " hi rCurlyError guifg=#65737e ctermfg=203 "[)\]]
" " " hi rParenError guifg=#65737e ctermfg=203 "[\]}]
" " " hi rDollar guifg=#65737e ctermfg=203 " $. @
" " " hi rLstElmt guifg=#65737e ctermfg=203 " list of elements
" " " hi rType guifg=#65737e ctermfg=203 " list of elements
" " "
" "
" " " Define the default highlighting.
" " " hi Boolean guifg=#ec5f67 ctermfg=203 " unicode characters
" " " hi Error guifg=#ec5f67 ctermfg=203 " unicode characters
" " " hi Comment guifg=#ec5f67 ctermfg=203 " unicode characters
" " " hi Todo guifg=#ec5f67 ctermfg=203 " unicode characters
" " " hi Number guifg=#ec5f67 ctermfg=203 " unicode characters
" " " hi Conditional guifg=#ec5f67 ctermfg=203 " unicode characters
" " " hi Constant guifg=#ec5f67 ctermfg=203 " unicode characters
" " " hi Delimiter guifg=#ec5f67 ctermfg=203 " unicode characters
" " " hi SpecialChar guifg=#ec5f67 ctermfg=203 " unicode characters
" " " hi Float guifg=#ec5f67 ctermfg=203 " unicode characters
" " " hi Function guifg=#ec5f67 ctermfg=203 " unicode characters
" " " hi Identifier guifg=#ec5f67 ctermfg=203 " unicode characters
" " " hi PreProc guifg=#ec5f67 ctermfg=203 " unicode characters
" " " hi PreCondit guifg=#ec5f67 ctermfg=203 " unicode characters
" " " hi Normal guifg=#ec5f67 ctermfg=203 " unicode characters
" " " hi Operator guifg=#ec5f67 ctermfg=203 " unicode characters
" " " hi Repeat guifg=#ec5f67 ctermfg=203 " unicode characters
" " " hi String guifg=#ec5f67 ctermfg=203 " unicode characters
" " " hi Type guifg=#ec5f67 ctermfg=203 " unicode characters
" " " hi Statment guifg=#65737e ctermfg=203 " unicode characters
" " " hi! link rStatement GruvboxGreen
" " " Statement
" " " Boolean
" " " Error
" " " Comment
" " " Todo
" " " Number
" " " Conditional
" " " Constant
" " " Delimiter
" " " SpecialChar
" " " Float
" " " Function
" " " Identifier
" " " PreProc
" " " PreCondit
" " " Normal
" " " Operator
" " " Repeat
" " " String
" " " Type
" " "
" " "
" " " hi Number guifg=#f99157 ctermfg=209
" " " hi ModeMsg guifg=#99c794 ctermfg=114 " visual and buffer
" " " hi Normal guifg=#c0c5ce ctermfg=251 guibg=#1b2b34 ctermbg=235 " basic color
" " " hi LineNr guifg=#65737e ctermfg=243 guibg=#343d46 ctermbg=237
" " " hi StatusLine guifg=#a7adba ctermfg=145 guibg=#4f5b66 ctermbg=240 gui=NONE cterm=NONE " tmux
" " " hi StatusLineNC guifg=#65737e ctermfg=243 guibg=#343d46 ctermbg=237 gui=NONE cterm=NONE "vm
" " " hi Constant guifg=#f99157 ctermfg=209
" " " hi Conditional guifg=#c594c5 ctermfg=176
" " " hi String guifg=#99c794 ctermfg=114
" " "
" " " hi Bold gui=bold cterm=bold
" " " hi Debug guifg=#ec5f67 ctermfg=203
" " " hi Directory guifg=#6699cc ctermfg=68
" " " hi ErrorMsg guifg=#ec5f67 ctermfg=203 guibg=#1b2b34 ctermbg=235
" " " hi Exception guifg=#ec5f67 ctermfg=203
" " " hi FoldColumn guibg=#343d46 ctermbg=237
" " " hi Folded guifg=#65737e ctermfg=243 guibg=#343d46 ctermbg=237
" " " hi IncSearch guifg=#343d46 ctermfg=237 guibg=#f99157 ctermbg=209
" " " hi Italic gui=underline cterm=underline
" " " hi Macro guifg=#ec5f67 ctermfg=203
" " " hi MatchParen guifg=#c0c5ce ctermfg=251 guibg=#65737e ctermbg=243
" " " hi ModeMsg guifg=#99c794 ctermfg=114
" " " hi MoreMsg guifg=#99c794 ctermfg=114
" " " hi Question guifg=#6699cc ctermfg=68
" " " hi Search guifg=#65737e ctermfg=243 guibg=#fac863 ctermbg=221
" " " hi SpecialKey guifg=#65737e ctermfg=243
" " " hi TooLong guifg=#ec5f67 ctermfg=203
" " " hi Underlined guifg=#ec5f67 ctermfg=203
" " " hi Visual guibg=#4f5b66 ctermbg=240
" " " hi VisualNOS guifg=#ec5f67 ctermfg=203
" " " hi WarningMsg guifg=#ec5f67 ctermfg=203
" " " hi WildMenu guifg=#ffffff ctermfg=15 guibg=#6699cc ctermbg=68
" " " hi Title guifg=#6699cc ctermfg=68 gui=NONE cterm=NONE
" " " hi Conceal guifg=#6699cc ctermfg=68 guibg=#1b2b34 ctermbg=235
" " " hi Cursor guifg=#1b2b34 ctermfg=235 guibg=#c0c5ce ctermbg=251
" " " hi NonText guifg=#65737e ctermfg=243
" " " hi Normal guifg=#c0c5ce ctermfg=251 guibg=#1b2b34 ctermbg=235
" " " hi LineNr guifg=#65737e ctermfg=243 guibg=#343d46 ctermbg=237
" " " hi CursorLineNR guifg=#ffffff ctermfg=15 guibg=#ffffff ctermbg=15
" " " hi SignColumn guifg=#65737e ctermfg=243 guibg=#343d46 ctermbg=237
" " " hi StatusLine guifg=#a7adba ctermfg=145 guibg=#4f5b66 ctermbg=240 gui=NONE cterm=NONE
" " " hi StatusLineNC guifg=#65737e ctermfg=243 guibg=#343d46 ctermbg=237 gui=NONE cterm=NONE
" " " hi VertSplit guifg=#4f5b66 ctermfg=240 guibg=#4f5b66 ctermbg=240 gui=NONE cterm=NONE
" " " hi ColorColumn guibg=#343d46 ctermbg=237 gui=NONE cterm=NONE
" " " hi CursorColumn guibg=#343d46 ctermbg=237 gui=NONE cterm=NONE
" " " hi CursorLine guibg=#343d46 ctermbg=237 gui=NONE cterm=NONE
" " " hi CursorLineNr guifg=#65737e ctermfg=243 guibg=#343d46 ctermbg=237
" " " hi PMenu guifg=#a7adba ctermfg=145 guibg=#343d46 ctermbg=237 gui=NONE cterm=NONE
" " " hi PMenuSel guifg=#343d46 ctermfg=237 guibg=#a7adba ctermbg=145
" " " hi PmenuSbar guibg=#4f5b66 ctermbg=240
" " " hi PmenuThumb guibg=#d8dee9 ctermbg=253
" " " hi TabLine guifg=#65737e ctermfg=243 guibg=#343d46 ctermbg=237 gui=NONE cterm=NONE
" " " hi TabLineFill guifg=#65737e ctermfg=243 guibg=#343d46 ctermbg=237 gui=NONE cterm=NONE
" " " hi TabLineSel guifg=#99c794 ctermfg=114 guibg=#343d46 ctermbg=237 gui=NONE cterm=NONE
" " " hi Boolean guifg=#f99157 ctermfg=209
" " " hi Character guifg=#ec5f67 ctermfg=203
" " " hi Comment guifg=#65737e ctermfg=243 gui=NONE cterm=NONE
" " " hi Conditional guifg=#c594c5 ctermfg=176
" " " hi Constant guifg=#f99157 ctermfg=209
" " " hi Define guifg=#c594c5 ctermfg=176 gui=NONE cterm=NONE
" " " hi Delimiter guifg=#ab7967 ctermfg=137
" " " hi Float guifg=#f99157 ctermfg=209
" " " hi Function guifg=#6699cc ctermfg=68
" " " hi Identifier guifg=#ec5f67 ctermfg=203 gui=NONE cterm=NONE
" " " hi Include guifg=#6699cc ctermfg=68
" " " hi Keyword guifg=#c594c5 ctermfg=176
" " " hi Label guifg=#fac863 ctermfg=221
" " " hi Number guifg=#f99157 ctermfg=209
" " " hi Operator guifg=#c0c5ce ctermfg=251 gui=NONE cterm=NONE
" " " hi PreProc guifg=#fac863 ctermfg=221
" " " hi Repeat guifg=#fac863 ctermfg=221
" " " hi Special guifg=#62b3b2 ctermfg=73
" " " hi SpecialChar guifg=#ab7967 ctermfg=137
" " " hi Statement guifg=#ec5f67 ctermfg=203
" " " hi StorageClass guifg=#fac863 ctermfg=221
" " " hi String guifg=#99c794 ctermfg=114
" " " hi Structure guifg=#c594c5 ctermfg=176
" " " hi Tag guifg=#fac863 ctermfg=221
" " " hi Todo guifg=#fac863 ctermfg=221 guibg=#343d46 ctermbg=237
" " " hi Type guifg=#fac863 ctermfg=221 gui=NONE cterm=NONE
" " " hi Typedef guifg=#fac863 ctermfg=221
" " " hi SpellBad guibg=#1b2b34 ctermbg=235 gui=undercurl cterm=undercurl
" " " hi SpellLocal guibg=#1b2b34 ctermbg=235 gui=undercurl cterm=undercurl
" " " hi SpellCap guibg=#1b2b34 ctermbg=235 gui=undercurl cterm=undercurl
" " " hi SpellRare guibg=#1b2b34 ctermbg=235 gui=undercurl cterm=undercurl
" " " hi csClass guifg=#fac863 ctermfg=221
" " " hi csAttribute guifg=#fac863 ctermfg=221
" " " hi csModifier guifg=#c594c5 ctermfg=176
" " " hi csType guifg=#ec5f67 ctermfg=203
" " " hi csUnspecifiedStatement guifg=#6699cc ctermfg=68
" " " hi csContextualStatement guifg=#c594c5 ctermfg=176
" " " hi csNewDecleration guifg=#ec5f67 ctermfg=203
" " " hi cOperator guifg=#62b3b2 ctermfg=73
" " " hi cPreCondit guifg=#c594c5 ctermfg=176
" " " hi cssColor guifg=#62b3b2 ctermfg=73
" " " hi cssBraces guifg=#c0c5ce ctermfg=251
" " " hi cssClassName guifg=#c594c5 ctermfg=176
" " " hi DiffAdd guifg=#99c794 ctermfg=114 guibg=#343d46 ctermbg=237
" " " hi DiffChange guifg=#65737e ctermfg=243 guibg=#343d46 ctermbg=237
" " " hi DiffDelete guifg=#ec5f67 ctermfg=203 guibg=#343d46 ctermbg=237
" " " hi DiffText guifg=#6699cc ctermfg=68 guibg=#343d46 ctermbg=237
" " " hi DiffAdded guifg=#ffffff ctermfg=15 guibg=#99c794 ctermbg=114
" " " hi DiffFile guifg=#ec5f67 ctermfg=203 guibg=#1b2b34 ctermbg=235
" " " hi DiffNewFile guifg=#99c794 ctermfg=114 guibg=#1b2b34 ctermbg=235
" " " hi DiffLine guifg=#6699cc ctermfg=68 guibg=#1b2b34 ctermbg=235
" " " hi DiffRemoved guifg=#ffffff ctermfg=15 guibg=#ec5f67 ctermbg=203
" " " hi gitCommitOverflow guifg=#ec5f67 ctermfg=203
" " " hi gitCommitSummary guifg=#99c794 ctermfg=114
" " " hi htmlBold guifg=#fac863 ctermfg=221
" " " hi htmlItalic guifg=#c594c5 ctermfg=176
" " " hi htmlTag guifg=#62b3b2 ctermfg=73
" " " hi htmlEndTag guifg=#62b3b2 ctermfg=73
" " " hi htmlArg guifg=#fac863 ctermfg=221 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
" " " hi htmlTagName guifg=#d8dee9 ctermfg=253
" " " hi javaScript guifg=#c0c5ce ctermfg=251
" " " hi javaScriptNumber guifg=#f99157 ctermfg=209
" " " hi javaScriptBraces guifg=#c0c5ce ctermfg=251
" " " hi markdownCode guifg=#99c794 ctermfg=114
" " " hi markdownCodeBlock guifg=#99c794 ctermfg=114
" " " hi markdownHeadingDelimiter guifg=#6699cc ctermfg=68
" " " hi markdownItalic guifg=#c594c5 ctermfg=176 gui=italic cterm=italic
" " " hi markdownBold guifg=#fac863 ctermfg=221 gui=bold cterm=bold
" " " hi markdownCodeDelimiter guifg=#ab7967 ctermfg=137 gui=italic cterm=italic
" " " hi markdownError guifg=#c0c5ce ctermfg=251 guibg=#1b2b34 ctermbg=235
" " " hi NeomakeErrorSign guifg=#ec5f67 ctermfg=203 guibg=#343d46 ctermbg=237
" " " hi NeomakeWarningSign guifg=#fac863 ctermfg=221 guibg=#343d46 ctermbg=237
" " " hi NeomakeInfoSign guifg=#ffffff ctermfg=15 guibg=#343d46 ctermbg=237
" " " hi NeomakeError guifg=#ec5f67 ctermfg=203 gui=undercurl cterm=undercurl
" " " hi NeomakeWarning guifg=#ec5f67 ctermfg=203 gui=undercurl cterm=undercurl
" " " hi NERDTreeExecFile guifg=#c0c5ce ctermfg=251
" " " hi NERDTreeDirSlash guifg=#6699cc ctermfg=68
" " " hi NERDTreeOpenable guifg=#c0c5ce ctermfg=251
" " " hi phpComparison guifg=#c0c5ce ctermfg=251
" " " hi phpParent guifg=#c0c5ce ctermfg=251
" " " hi phpMemberSelector guifg=#c0c5ce ctermfg=251
" " " hi pythonRepeat guifg=#c594c5 ctermfg=176
" " " hi pythonOperator guifg=#c594c5 ctermfg=176
" " " hi rubyConstant guifg=#fac863 ctermfg=221
" " " hi rubySymbol guifg=#99c794 ctermfg=114
" " " hi rubyAttribute guifg=#6699cc ctermfg=68
" " " hi rubyInterpolation guifg=#99c794 ctermfg=114
" " " hi rubyInterpolationDelimiter guifg=#ab7967 ctermfg=137
" " " hi rubyStringDelimiter guifg=#99c794 ctermfg=114
" " " hi rubyRegexp guifg=#62b3b2 ctermfg=73
" " " hi sassidChar guifg=#ec5f67 ctermfg=203
" " " hi sassClassChar guifg=#f99157 ctermfg=209
" " " hi sassInclude guifg=#c594c5 ctermfg=176
" " " hi sassMixing guifg=#c594c5 ctermfg=176
" " " hi sassMixinName guifg=#6699cc ctermfg=68
" " " hi vimfilerLeaf guifg=#c0c5ce ctermfg=251
" " " hi vimfilerNormalFile guifg=#c0c5ce ctermfg=251 guibg=#1b2b34 ctermbg=235
" " " hi vimfilerOpenedFile guifg=#6699cc ctermfg=68
" " " hi vimfilerClosedFile guifg=#6699cc ctermfg=68
" " " hi GitGutterAdd guifg=#99c794 ctermfg=114 guibg=#343d46 ctermbg=237
" " " hi GitGutterChange guifg=#6699cc ctermfg=68 guibg=#343d46 ctermbg=237
" " " hi GitGutterDelete guifg=#ec5f67 ctermfg=203 guibg=#343d46 ctermbg=237
" " " hi GitGutterChangeDelete guifg=#c594c5 ctermfg=176 guibg=#343d46 ctermbg=237
" " " hi xmlTag guifg=#62b3b2 ctermfg=73 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
" " " hi xmlTagName guifg=#c0c5ce ctermfg=251 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
" " " hi xmlEndTag guifg=#62b3b2 ctermfg=73
