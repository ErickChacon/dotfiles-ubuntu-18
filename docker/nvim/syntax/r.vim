"
" " Vim syntax file
" " Language: Stan
" " Maintainer: Erick A. Chacon
" " Latest Revision: 27 Jan 2017
"
" if exists("b:current_syntax")
"   finish
" endif
"
" " syntax match stanFunction "\v(data|model|parameters|transformed|generated|quantities)"
" " " highlight link stanKeyword Keyword
" "
" " syntax keyword stanKeyword int real for in vector row_vector
" "
" " highlight link stanKeyword Keyword
" " syntax match stanComment "\v(//|#).*$"
" " highlight link stanComment Comment
" " syntax match stanOperator "\v\*"
" " " syntax match stanOperator "\v/"
" " syntax match stanOperator "\v\+"
" " syntax match stanOperator "\v-"
" " syntax match stanOperator "\v\?"
" " syntax match stanOperator "\v\*\="
" " syntax match stanOperator "\v/\="
" " syntax match stanOperator "\v\+\="
" " syntax match stanOperator "\v-\="
" " syntax match stanOperator "\v\="
" " syntax match stanOperator "\v\:"
" " syntax match stanOperator "\v\|"
" " syntax match stanOperator "\v\("
" " syntax match stanOperator "\v\)"
" " syntax match stanOperator "\v\["
" " syntax match stanOperator "\v\]"
" " syntax match stanOperator "\v\<"
" " syntax match stanOperator "\v\>"
" " syntax match stanOperator "\v\,"
" "
" " hi! link stanOperator GruvboxYellow
" " syntax match stanEnd "\v\;"
" " hi! link stanEnd GruvboxBlue
" " syntax match stanBrace "\v(\{|\})"
" " hi! link stanBrace GruvboxOrange
" " " highlight link stanOperator Operator
" " " " Match syntax
" " " syn match stanFunction "\v^(\w|\s)+\{"
" " hi! link stanFunction GruvboxAqua
" " echom "Our syntax highlighting code will go here."
" let b:current_syntax = "r"
