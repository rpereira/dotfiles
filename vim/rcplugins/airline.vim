" ----------------------------------------------------------------------------
" Airline
" ----------------------------------------------------------------------------
" Note: The airline theme is defined on the `theme.vim` file.

let g:airline_extensions = ['hunks', 'syntastic', 'tabline', 'whitespace']

let g:airline_powerline_fonts = 1

let g:airline#extensions#tabline#buffer_nr_format = '%s '
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#fnamecollapse = 0
let g:airline#extensions#tabline#fnamemod = ':t'
