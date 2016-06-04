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

" ----------------------------------------------------------------------------
" Supper toggling powers
" ----------------------------------------------------------------------------
" Example: When I hit `0` for the first time, I want it be be like `^`. If I hit
" it again, I want it to finish its travels and go to the first column.
function! ToggleMovement(firstOp, thenOp)
  let pos = getpos('.')
  execute "normal! " . a:firstOp
  if pos == getpos('.')
    execute "normal! " . a:thenOp
  endif
endfunction

nnoremap <silent> 0 :call ToggleMovement('^', '0')<CR>
