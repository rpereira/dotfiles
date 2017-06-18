" ----------------------------------------------------------------------------
" :Root | Change directory to the root of the Git repository
" ----------------------------------------------------------------------------
function! s:root()
  let root = systemlist('git rev-parse --show-toplevel')[0]
  if v:shell_error
    echo 'Not in git repo'
  else
    execute 'lcd' root
    echo 'Changed directory to: '.root
  endif
endfunction
command! Root call s:root()

" ----------------------------------------------------------------------------
" :Todo | Grep the specified pattern and open the results on a quickfix window
" and prevents the output from being displayed on the shell.
" ----------------------------------------------------------------------------
function! g:Grep(pattern) abort
  let entries = []
  let cmd = 'ag ' . a:pattern . ' 2> /dev/null'
  let lines = split(system(cmd), '\n')

  if v:shell_error != 0
    continue
  endif

  for line in lines
    let [fname, lnum, text] = matchlist(line, '^\([^:]*\):\([^:]*\):\(.*\)')[1:3]
    call add(entries, { 'filename': fname, 'lnum': lnum, 'text': text })
  endfor

  if !empty(entries)
    call setqflist(entries)
    copen
  endif
endfunction

" TODO: I might not need the previous function at all. Using something like
" `command! Todo Ag TODO` could be enough.
command! Todo call g:Grep('TODO\|FIXME\|XXX')

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

" ----------------------------------------------------------------------------
" <Leader>bf | Fuzzy find buffer name from the buffer list and select it
" ----------------------------------------------------------------------------
function! s:buflist()
  redir => ls
  silent ls
  redir END
  return split(ls, '\n')
endfunction

function! s:bufopen(e)
  execute 'buffer' matchstr(a:e, '^[ 0-9]*')
endfunction

nnoremap <silent> <Leader>bf :call fzf#run({
\   'source':  reverse(<sid>buflist()),
\   'sink':    function('<sid>bufopen'),
\   'options': '+m',
\   'down':    len(<sid>buflist()) + 2
\ })<CR>

" ----------------------------------------------------------------------------
" :Shuffle | Shuffle selected lines
" ----------------------------------------------------------------------------
function! s:Shuffle() range
ruby << EOF
  first, last = %w[a:firstline a:lastline].map { |e| VIM::evaluate(e).to_i }
  (first..last).map { |l| $curbuf[l] }.shuffle.each_with_index do |line, i|
    $curbuf[first + i] = line
  end
EOF
endfunction

command! -range Shuffle <line1>,<line2>call s:Shuffle()
