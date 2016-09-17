" By default, pressing <TAB> in command mode will choose the first possible
" completion with no indication of how many others there might be. The following
" configuration lets you see what your other options are:
set wildmenu

" A list of file patterns to ignore when performing expansion and completion.
set wildignore+=*.swp,*.bak
set wildignore+=*/.git/**/*
set wildignore+=tags
set wildignore+=*.class,*.min.*
set wildignore+=*/min/*,*/vendor/*,*/node_modules/*,*/bower_components/*
set wildignore+=*.tar.*

" Ignore case when completing file names and directories.
set wildignorecase

" Lookup words for keyword completion commands i_CTRL-X_CTRL-K.
set dictionary+=/usr/share/dict/words
