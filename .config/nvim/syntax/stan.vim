" Vim syntax file
" Language: Stan
" Maintainer: Erick A. Chacon
" Latest Revision: 27 Jan 2017

if exists("b:current_syntax")
  finish
endif

" Read the C syntax to start with
runtime! syntax/cpp.vim
unlet b:current_syntax


syntax match stanFunction "\v(data|model|parameters|transformed|generated|quantities)"
hi! link stanFunction Keyword

syntax keyword stanTypes int real vector row_vector matrix
highlight link stanTypes Type

syntax match stanOperator "\v\~"
hi! link stanOperator Operator

let b:current_syntax = "stan"
