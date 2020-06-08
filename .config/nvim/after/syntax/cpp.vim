" Additional cpp syntax file
" Language:	      c++
" Maintainer: Erick Chacon
" Description: Additional cpp syntax file

" Matching delimiters
syn match Special "\((\|)\|\[\|\]\|{\|}\)"

" Roxygen tags
syn match Roxygen "@\w\+" containedin=cCommentL,cComment
hi! link Roxygen Operator
syn match roxTitle "\(@title.*\)" containedin=cCommentL,cComment contains=Roxygen
hi! link roxTitle GruvboxGreenBold

" Matching operators
" syn match Operator "\(/\)" contains=ALLBUT,cComment
syn match Operator "\(,\|:\|\.\|=\|;\|*\|+\|-\|<\|>\|!\)"

" Namespace libraries
hi! link cCustomClass Identifier
" Scope ::
hi! link cCustomScope Operator

" syn keyword cType mat vec NumericVector List

" Custom color using gruvbox colorscheme
if g:colors_name == 'gruvbox'
  " hi! link Function GruvboxAqua
  hi! link cCustomFunc GruvboxAqua
  hi! link Operator GruvboxRed
endif
