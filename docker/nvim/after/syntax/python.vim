
" Matching functions
" syn match pythonFunction "\v(\w|\.)+\(&(\w|\.)+"
" syn match pythonFunction "\v(\w)+\("
syn match pythonFunction "\(\w\)\+(\&\(\w\)"
syn match Special "\((\|)\|\[\|\]\|{\|}\)"
syn match pythonOperator "\(,\|:\|\.\)"

" Custom color using gruvbox colorscheme
if g:colors_name == 'gruvbox'

  hi! link pythonImport GruvboxBlue

endif

