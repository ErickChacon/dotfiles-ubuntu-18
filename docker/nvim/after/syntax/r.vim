" Additional r syntax file
" Language:	      R (GNU S)
" Maintainer: Erick Chacon
" Description: R function recognizition and highlighting grouping

" Matching functions
syn match rFunction "\v(\w|\.)+\(&(\w|\.)+"
syn match rFunction "\(\w\|\.\)\+\s\(<-\|=\)\sfunction\&\(\w\|\.\)\+"
" hi! link rFunction Function

" Matching functions
syn match rLibrary "\(\w\)\+::\&\(\w\)"
hi! link rLibrary Identifier

" Matching r additional arguments ...
syn match rConstant "\.\.\."
" hi! link rConstant Constant

" Matching custom description
syntax match rDescr "\(Title\|Desc\|Input\|Output\|Author\|Date\|Status\):"
      \ containedin=rComment
hi! link rDescr VimCommentTitle
" hi! link rDescr Todo

" Custom color using gruvbox colorscheme
if g:colors_name == 'gruvbox'

  " Constants:  NULL, T, F, letters, pi
  hi! link Constant GruvboxBlueBold
  " hi! link rConstant GruvboxBlueBold
  " String:
  " call s:HL('String', s:green, s:none, s:italicize_strings)
  " Character: no characters defined in r
  " Number:
  hi! link Number GruvboxPurple
  " hi! link rNumber GruvboxPurple
  " Boolean:
  hi! link Boolean GruvboxBlueBold
  " hi! link rBoolean GruvboxBlueBold
  " Float:
  hi! link Float GruvboxPurple
  " hi! link rFloat GruvboxPurple

  " Functions:
  hi! link Function GruvboxAqua

  " Statements:"
  hi! link Statement GruvboxRedBold
  " hi! link rAssign GruvboxRedBold
  " " break next return
  hi! link rStatement GruvboxYellow
  " Conditional: if else
  hi! link Conditional GruvboxBlueBold
  " hi! link rConditional GruvboxBlueBold
  " Repeat: for in repeat while
  hi! link Repeat GruvboxBlueBold
  " hi! link rRepeat GruvboxBlueBold
  " Operator: &, -, \, +, %>%
  hi! link Operator GruvboxRed
  " hi! link rOperator GruvboxRed

  " PreProc: library require attach detach source
  hi! link PreProc GruvboxAqua
  " hi! link rPreProc GruvboxAqua

  " Type: array category character complex double function integer list logical matrix numeric vector data.frame
  hi! link Type GruvboxYellow

  " Special:
  hi! link Special GruvboxOrange
  " " $ @
  " hi! link rDollar GruvboxOrange
  " " New line, carriage return, tab, backspace, bell, feed, vertical tab, backslash
  " " Hexadecimal and Octal digits
  " " Unicode characters
  " hi! link rSpecial GruvboxYellow
  " " (), {}, []
  " hi! link Delimiter GruvboxRed
  " " , : ;
  hi! link rDelimiter GruvboxRed

endif

  " hi! link Delimiter GruvboxRed
  " hi! link rDelimiter GruvboxRed
  " hi rDelimiter guifg=red
  " hi Delimiter guifg=red





" set g:gruvbox_italicize_strings=1
" Match syntax
" hi! link rFunction GruvboxAqua

" syn keyword rDescr Title Desc Input Output Author Date containedin=rComment
" syn region rRegion start=/\{/ matchgroup=Delimiter end=/}/ transparent containedin=ALL
"
" Fold
" syn match rFolded "[a-z]" containedin=Folded
" hi! link rFolded GruvboxRed
" syn region rPlop matchgroup=Delimiter start=/{{{/ matchgroup=Delimiter end=/}}}/ transparent contains=ALLBUT,rError,rBraceError,rCurlyError fold
" "
"
" syn region cMarkerFold matchgroup=Comment start="{{{" end="}}}" containedin=rComment contains=ALL keepend extend fold transparent
" syn region myFold start="{{{" end="}}}" containedin=ALL transparent fold
"
" syn region rRegion matchgroup=Delimiter start=/SEC/ matchgroup=Delimiter end=/-/ transparent containedin=rComment fold
" syn region rRegion start=/{{{/  end=/}}}/ transparent containedin=ALL fold
" This folding is working but need to be improved somehow
" syn region rRegion start=/\s---/  end=/\s---/ transparent containedin=ALL fold
" syn region rRegion start=/^#\s.*-----/  end=/}}}/ transparent containedin=rComment fold
" syn region rRegion start=/^#\s.*-----/  end=/}}}/ transparent containedin=ALL fold

" from internet
" syn region cMarkerFold matchgroup=Comment start="{{{" end="}}}"
" containedin=cCommentL,cComment contains=ALL keepend extend fold
" transparent

