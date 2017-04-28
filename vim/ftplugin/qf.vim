" Text wrapping is pretty much useless in the quickfix window
setlocal nowrap

" Relative line numbers don't make much sense either but absolute numbers
" definitely do
setlocal norelativenumber
setlocal number

" We don't want quickfix buffers to pop up when doing :bn or :bp
set nobuflisted

"
" Keyboard Shortcuts
"

" open in new tab
nnoremap <buffer> <silent> t <C-W><CR><C-W>T
" open in new tab without moving to it
nnoremap <buffer> <silent> T <C-W><CR><C-W>TgT<C-W>j
" open (same as Enter)
nnoremap <buffer> <silent> o <CR>
" open and close the quickfix window
nnoremap <buffer> <silent> O <CR><C-W>p<C-W>c
" open in horizontal split
nnoremap <buffer> <silent> h <C-W><CR><C-W>K
" open in horizontal split, keeping focus on the results
nnoremap <buffer> <silent> H <C-W><CR><C-W>K<C-W>b
" open in vertical split
nnoremap <buffer> <silent> v <C-W><CR><C-W>H<C-W>b<C-W>J<C-W>t
" open in vertical split, keeping focus on the results
nnoremap <buffer> <silent> gv <C-W><CR><C-W>H<C-W>b<C-W>J
