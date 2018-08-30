"
" " Only load this indent file when no other was loaded.
" if exists("b:did_indent")
"   finish
" endif
" let b:did_indent = 1
"
" setlocal indentkeys=0{,0},:,!^F,o,O,e
" setlocal indentexpr=GetRIndent1()
"
" " Only define the function once.
" if exists("*GetRIndent1")
"   finish
" endif
"
"
" let g:r_indent_op_pattern = '\(&\||\|+\|-\|\*\|/\|=\|\~\|%\|->\)\s*$'
" " let g:r_indent_op_pattern = "\(&\||\|+\|-\|\*\|/\|=\|\~\|%\|->\)\s*$"
"
" " |indent()|, |cindent()| and |lispindent()|.
"
" function GetRIndent1()
"   let clnum = v:lnum
"   let cline = getline(clnum)
"   let pline = getline(clnum-1)
"   let ppline = getline(clnum-2)
"
"   if pline =~ g:r_indent_op_pattern
"     if match(pline, "<-") > 0
"       return indent(clnum - 1) + shiftwidth()
"     endif
"     " if  ppline =~ g:r_indent_op_pattern
"     "   return indent(clnum - 1)
"     " elseif ppline =~ ",$"
"     "   return indent(clnum - 1) - shiftwidth()
"     " else
"     "   return indent(clnum - 1) + shiftwidth()
"     " endif
"     " let brace_col = matchend(pline, ")\\s") - 1
"     " let brace_col = match(pline, ")") + 1
"     let brace_col = strridx(pline, ")") + 1
"     " echo brace_col
"     if brace_col > 0
"       " if v:lnum == 15
"       "   let brace_col = 48
"       " endif
"       call cursor(v:lnum - 1, brace_col)
"       let [aux_lnum,aux_col] = searchpairpos('(', '', ')', 'bWn')
"       return indent(aux_lnum)
"     else
"       return indent(clnum - 1) + shiftwidth()
"     endif
"     " return brace_col
"   endif
"
"
"   if pline =~ ",$"
"     if match(pline, "(") > 0
"       return match(pline, "(") + 1
"     else
"       return indent(clnum - 1)
"     endif
"     " return indent(clnum - 1) + shiftwidth()
"     " if ppline =~ "($"
"     " return 0
"     " else
"     " return match(pline, "(") + 1
"     " endif
"   endif
"
"   if pline =~ "($"
"     return indent(clnum - 1) + shiftwidth()
"   endif
"
"
"   " if pline =~ "{\s*$"
"   "   " && pline !~ "}" && cline !~ "}" && cline !~ ":$"
"   "   " return indent(pline) + 2
"   "   return shiftwidth()
"   " else
"   " return indent(pline)
"   " endif
"   " if clnum == 1
"   "   return 0
"   " else
"   "   " return indent(cline) + 2
"   "   return indent(v:lnum) + 2
"   " endif
"
"   " return indent(v:lnum - 1) + 2
" endfunction
"
" " let g:r_indent_align_args = 0
" " let g:r_indent_ess_comments = 1
" " let g:r_indent_comment_column = 4
" " let g:r_indent_ess_compatible = 1
