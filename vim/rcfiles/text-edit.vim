" Fast saving
map  ,, :w<CR>
imap ,, <C-o>:w<CR>

" Fast saving & exiting
nmap <leader>x :x<CR>

nmap <leader>qa :qall<CR>

" Smart-insert semicolon
inoremap <leader>; <C-o>A;<Esc>:w<CR>
nnoremap <leader>; A;<Esc>:w<CR>

" Make Y consistent with C and D
nnoremap Y y$
