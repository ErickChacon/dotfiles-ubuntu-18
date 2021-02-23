" File: netrw.vim
" Author: Erick A. Chacón Montalván
" Description: File type highlighting
" Last Modified: January 25, 2021

if exists("b:current_syntax")
    let s:current_syntax = b:current_syntax
    unlet b:current_syntax
endif

" Group of files
syntax match netrwDoc      "\(\S\+ \)*\S\+\.\%(tex\|md\|Rmd\|ods\)\>"            contains=netrwTreeBar,@NoSpell
syntax match netrwData     "\(\S\+ \)*\S\+\.\%(csv\|bib\|RData\|Rdata\|rds\|fst\)\>"  contains=netrwTreeBar,@NoSpell
syntax match netrwHigh     "\(\S\+ \)*\S\+\.\%(R\|jl\|py\)\>"               contains=netrwTreeBar,@NoSpell
syntax match netrwLow       "\(\S\+ \)*\S\+\.\%(c\|cpp\)\>"                 contains=netrwTreeBar,@NoSpell
syntax match netrwWeb       "\(\S\+ \)*\S\+\.\%(yml\|html\|css\|php\|js\)\>"        contains=netrwTreeBar,@NoSpell

" Linking files to common groups
hi! link netrwDoc String
hi! link netrwData Constant
hi! link netrwHigh Identifier
hi! link netrwLow Typedef
hi! link netrwWeb Statement
hi! link netrwMakeFile Comment

let b:current_syntax=s:current_syntax
