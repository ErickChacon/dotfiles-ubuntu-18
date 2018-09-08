
syn match juliaFunction "\(\w\|\.\)\+(\&\(\w\|\.\)"
syn match juliaFunction  "\(\w\|\.\)\+(\&\(\w\|\.\)" containedin=juliaConditionalBlock,juliaWhileBlock,juliaForBlock,juliaBeginBlock,juliaFunctionBlock,juliaMacroBlock,juliaQuoteBlock,juliaTypeBlock,juliaImmutableBlock,juliaExceptionBlock,juliaLetBlock,juliaDoBlock,juliaModuleBlock,juliaConditionalEBlock,juliaConditionalEIBlock,juliaParBlock		 contained
" juliaCommentItems

hi link juliaFunction Function
hi link juliaComma Operator
hi link juliaSemicolon Operator
hi link juliaParDelim Delimiter

" Custom color using gruvbox colorscheme
if g:colors_name == 'gruvbox'

  hi! link Operator GruvboxRed
  hi! link juliaFunction GruvboxAqua


endif
