" Additional tex syntax file
" Language:	      tex
" Maintainer: Erick Chacon
" Description:

" I added the following command to the main /usr/local/share/nvim/runtime/syntax/tex.vim
" call TexNewMathZone("E","align",1)

" " Matching chapter, part, section, subsection and corresponding  titles
" syn match texContent  '\\\%(chapter\>\|part\|section\>\|subsection\>\|subsubsection\)' containedin=ALLBUT,texComment nextgroup=texContentNames
" syn region texContentNames matchgroup=Delimiter start="{" end="}" contained
" hi texContentNames gui=bold,italic cterm=bold
" " hi! link texContentNames Title
" hi link texContent Statement
"
" " Matching begin and end document
" syn match document  '\\\(begin\|end\){document}' containedin=ALLBUT,texComment
" hi link document Boolean
"
" " Linking tex regions to more general groups
" " hi! link texDocType GruvboxRed " documentclass default
" " hi link texCmdArgs Type
" " hi link texSection Statement " title, author
" hi link texTitle Identifier " inside title, author
" hi link texAbstract Identifier "inside abtsract " does not work cos changes
" " hi! link texStatement GruvboxAqua " most commasnd
" hi link texRefZone String " references
" " hi! link texBeginEnd GruvboxBlueBold " begin, end, envir
" " hi! link texBeginEndName GruvboxBlueBold " envir name
" " hi! link texBeginEndModifier GruvboxBlueBold " envir name
" " hi! link texMath GruvboxBlue
" " hi! link texMathOper GruvboxBlue " =
" " hi! link texMathDelim GruvboxPurple " nothing
" " hi! link texMathText GruvboxGreen
" " " hi! link texMathSymbol GruvboxBlue
" " hi! link texMathMatcher GruvboxYellow" (1-\tau)
" " hi! link texSuperscript GruvboxRed
" " hi! link texSubscript GruvboxPurple
" " " hi! link texSpecialChar GruvboxYellow " \\
" " hi! link texGreek GruvboxYellow
" " " hi! link Special GruvboxBlue
" " hi! link texInputFile GruvboxBlueBold
" " hi! link texInputFileOpt GruvboxFg1
" " hi! link texDelimiter Special " {}
" " hi! link texTypeSize GruvboxYellow
"
" " if g:colors_name == 'nord'
" "   hi! link texMath Conceal
" " endif
" "
"
" if g:colors_name == 'deus'
"
"   hi! link texStatement Identifier " most commasnd
"   hi! link texMath Type
" endif
"
" if g:colors_name == 'dracula'
"   hi! link texSpecialChar String
"   hi! link texMathMatcher String
"   hi! link texRefZone Identifier
" endif
"
"
" " Custom color using gruvbox colorscheme
" if g:colors_name == 'gruvbox'
"
"   hi! link document GruvboxPurpleBold
"   hi! link texContent GruvboxAquaBold
"
"   hi! link texDocType GruvboxRed " documentclass
"   hi! link texDocTypeArgs GruvboxYellow "docclass args
"   " hi! link texInputFile GruvboxBlue " packages, graphs
"   " hi! link texBeginEnd GruvboxBlue " begin, end
"   " hi! link texPreamble GruvboxYellowBold " nothing
"   hi! link texSection GruvboxRed " title, author
"   hi! link texTitle GruvboxBlue "inside title, author
"   hi! link texAbstract GruvboxBlue "inside abtsract " does not work cos changes
"   " hi! link texSectionZone GruvboxRedBold "inside abtsract
"   " hi! link texParaZone GruvboxBlueBold "inside abtsract
"   " hi! link texZone GruvboxBlueBold "inside abtsract
"   hi! link texStatement GruvboxAqua " most commasnd
"   hi! link texRefZone GruvboxGreenBold " references
"   hi! link texBeginEnd GruvboxBlueBold " begin, end, envir
"   hi! link texBeginEndName GruvboxBlueBold " envir name
"   hi! link texBeginEndModifier GruvboxBlueBold " envir name
"   hi! link texMath GruvboxBlue
"   hi! link texMathOper GruvboxBlue " =
"   " hi! link texMathDelim GruvboxPurple " nothing
"   hi! link texMathText GruvboxGreen
"   " hi! link texMathSymbol GruvboxBlue
"   hi! link texMathMatcher GruvboxYellow " (1-\tau)
"   hi! link texSuperscript GruvboxRed
"   hi! link texSubscript GruvboxPurple
"   " hi! link texSpecialChar GruvboxYellow " \\
"   hi! link texGreek GruvboxYellow
"   " hi! link Special GruvboxBlue
"   hi! link texInputFile GruvboxBlueBold
"   hi! link texInputFileOpt GruvboxFg1
"   hi! link texDelimiter Special " {}
"   hi! link texTypeSize GruvboxYellow
"   hi! link texString GruvboGray
" endif
"
" " \begin \end colors
" " syn region texBeginingCommand start='\\begin\>\|\\end\>' end="}" containedin=ALLBUT,texComment
" " syn region texBegName matchgroup=texBeginingCommand start='\\begin{\|\\end{' end="}"
" " hi! link texBeginingCommand GruvboxRedBold
" " hi! link texBegName GruvboxBlueBold
"
" " " Curlies
" " syn match texCurlies "{\|}" containedin=texSection
"
"
" " TexFold syn region texTitle			matchgroup=texSection start='\\\%(author\|title\)\>\s*{' end='}'													contains=@texFoldGroup,@Spell
" " hi! link texSectionZone GruvboxRed
" " syn match plop "[a-z]" containedin=texSectionZone
" " hi! link plop GruvboxRed
