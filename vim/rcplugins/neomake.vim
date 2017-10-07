autocmd! BufWritePost * Neomake
let g:neomake_open_list = 0

" Haskell
" These makers should be on $PATH. See zsh/zprofile for more information.
let g:neomake_haskell_enabled_makers = ['ghcmod', 'hlint']

" JavaScript
let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_jsx_enabled_makers = ['eslint']
let g:neomake_javascript_eslint_exe = $PWD . '/node_modules/.bin/eslint'
let g:neomake_javascript_eslint_maker = {
    \ 'args': ['-f', 'compact'],
    \ 'errorformat': '%E%f: line %l\, col %c\, Error - %m,' .
    \ '%W%f: line %l\, col %c\, Warning - %m'
    \ }
