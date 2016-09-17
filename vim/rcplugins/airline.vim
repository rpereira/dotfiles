" Note: The airline theme is defined on the `theme.vim` file.
let g:airline_extensions = ['branch', 'hunks', 'tabline']

" I'm defining these 2 here because if I define them on the array, the
" statusline is rendered with some red spaces.
let g:airline#extensions#syntastic#enabled  = 1
let g:airline#extensions#whitespace#enabled = 1

let g:airline_powerline_fonts = 1

let g:airline#extensions#tabline#buffer_nr_format = '%s '
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#fnamecollapse = 0
let g:airline#extensions#tabline#fnamemod = ':t'
