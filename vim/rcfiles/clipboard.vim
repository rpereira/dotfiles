" Yank to system clipboard.
nmap <leader>y "*y
vmap <leader>y "*y

" Delete to system clipboard.
nmap <leader>d "*d
vmap <leader>d "*d

" Preserve indentation while pasting text from the system clipboard.
noremap <leader>p :set paste<CR>:put *<CR>:set nopaste<CR>
