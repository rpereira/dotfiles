" Load plugin manually.
augroup ultisnips_lazy_load
  autocmd!
  autocmd FileType javascript.jsx,java call plug#load('ultisnips')
        \| autocmd! ultisnips_lazy_load
augroup END

let g:UltiSnipsExpandTrigger='<tab>'
let g:UltiSnipsJumpForwardTrigger='<tab>'
let g:UltiSnipsJumpBackwardTrigger='<s-tab>'
