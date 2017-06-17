" Switch to the existing tab if the buffer is open; otherwise create a new one.
" set switchbuf=useopen,usetab

" Cicle through buffers
nnoremap ]b :bnext<CR>
nnoremap [b :bprevious<CR>

" Delete current buffer
noremap <leader>d :bdelete<CR>
