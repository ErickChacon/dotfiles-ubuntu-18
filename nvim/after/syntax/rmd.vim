" setlocal conceallevel=0
" "   syntax match rmdChunkDelim "^[ \t]*```{r" contained
" "   syntax match rmdChunkDelim "}$" contained
" "
" " Not required because vim-pandoc-syntax makes that
"  syn include @yamlTop syntax/yaml.vim
"   syn region Comment matchgroup=mkdDelimiter start="\%^---$" end="^---$" contains=@yamlTop keepend
" unlet! b:current_syntax
