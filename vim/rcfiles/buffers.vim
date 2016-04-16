" Switch to the existing tab if the buffer is open; otherwise create a new one.
set switchbuf=useopen,usetab

" List buffers and edit the specified buffer from the buffer list
nnoremap gb :ls<CR>:buffer<Space>
nnoremap gB :ls<CR>:sbuffer<Space>

" Search for the specified buffer name
nnoremap ,b :buffer *
nnoremap ,B :sbuffer *

" Cicle through buffers
nnoremap bn :bnext<CR>
nnoremap bp :bprevious<CR>
