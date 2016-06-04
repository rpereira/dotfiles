" ----------------------------------------------------------------------------
" <Leader>?/! | Google it / Feeling lucky
" ----------------------------------------------------------------------------
function! s:GoogleIt(pat, feelingLucky)
  let q = '"'.substitute(a:pat, '["\n]', ' ', 'g').'"'
  let q = substitute(q, '[[:punct:] ]',
                     \ '\=printf("%%%02X", char2nr(submatch(0)))', 'g')
  call system(printf('open "https://www.google.com/search?%sq=%s"',
                     \ a:feelingLucky ? 'btnI&' : '', q))
endfunction

nnoremap <leader>? :call <SID>GoogleIt(expand("<cWORD>"), 0)<CR>
nnoremap <leader>! :call <SID>GoogleIt(expand("<cWORD>"), 1)<CR>
xnoremap <leader>? "gy:call <SID>GoogleIt(@g, 0)<CR>gv
xnoremap <leader>! "gy:call <SID>GoogleIt(@g, 1)<CR>gv
