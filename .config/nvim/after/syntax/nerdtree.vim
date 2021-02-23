"
" " Creating groupd of files
" syn match nerdText "^\s\+.*\(md\|tex\|bib\|txt\|Rnw\).\?$" " space at least one time
" syn match nerdCompile "^\s\+.*\(pdf\|csv\).\?$"
" syn match nerdWeb "^\s\+.*\(yml\|html\|css\|php\|js\).\?$"
" syn match nerdLow "^\s\+.*\(c\|cpp\).\?$"
" syn match nerdStat "^\s\+.*\(R\|cpp\|RData\).\?$"
" syn match nerdPy "^\s\+.*\(py\).\?$"
"
" " " Old highlighting for directories
" " hi! link NERDTreeDir GruvboxAquaBold
" " hi! link NERDTreeUp GruvboxAquaBold
" " hi! link NERDTreeOpenable GruvboxAquaBold
" " hi! link NERDTreeClosable GruvboxAquaBold
"
" " " Old file highlighting
" " hi! link nerdText GruvboxGreen
" " hi! link nerdCompile GruvboxGray
" " hi! link nerdWeb GruvboxPurple
" " hi! link nerdLow GruvboxRed
" " hi! link nerdStat GruvboxBlue
" " hi! link nerdPy GruvboxOrange
"
" " Linking NERDTree parts to common groups
" hi! link NERDTreeDir PreProc
" hi! link NERDTreeUp PreProc
" hi! link NERDTreeOpenable PreProc
" hi! link NERDTreeClosable PreProc
"
" " Linking files to common groups
" hi! link nerdText String
" hi! link nerdCompile Comment
" hi! link nerdWeb Boolean
" hi! link nerdLow Statement
" hi! link nerdStat Identifier
" hi! link nerdPy Special
