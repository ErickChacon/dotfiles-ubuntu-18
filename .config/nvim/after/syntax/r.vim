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
if exists('g:colors_name')
  if g:colors_name == 'gruvbox'

    " Constants:  NULL, T, F, letters, pi
    hi! link Constant GruvboxBlueBold

    " String:
    " call s:HL('String', s:green, s:none, s:italicize_strings)

    " Character: no characters defined in r
    " Number:
    hi! link Number GruvboxPurple

    " Boolean:
    hi! link Boolean GruvboxBlueBold

    " Float:
    hi! link Float GruvboxPurple

    " Functions:
    hi! link Function GruvboxAqua

    " Statements:"
    hi! link Statement GruvboxRedBold
    hi! link rStatement GruvboxYellow

    " Conditional: if else
    hi! link Conditional GruvboxBlueBold

    " Repeat: for in repeat while
    hi! link Repeat GruvboxBlueBold

    " Operator: &, -, \, +, %>%
    hi! link Operator GruvboxRed
    " hi! link rOperator GruvboxRed

    " PreProc: library require attach detach source
    hi! link PreProc GruvboxAqua

    " Type: array category character complex double function integer list logical matrix numeric vector data.frame
    hi! link Type GruvboxYellow

    " Special:
    hi! link Special GruvboxOrange
    hi! link rDelimiter GruvboxRed

  endif
endif

