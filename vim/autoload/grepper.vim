" MIT License
"
" Copyright (c) 2017 Rui Afonso Pereira
"
" Permission is hereby granted, free of charge, to any person obtaining a copy
" of this software and associated documentation files (the "Software"), to deal
" in the Software without restriction, including without limitation the rights
" to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
" copies of the Software, and to permit persons to whom the Software is
" furnished to do so, subject to the following conditions:
"
" The above copyright notice and this permission notice shall be included in all
" copies or substantial portions of the Software.
"
" THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
" IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
" FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
" AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
" LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
" OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
" SOFTWARE.

" Search for the provided text and open a 'quickfix' window showing the results.
function! grepper#run(args) abort
  if strlen(a:args) == 0
    call s:error('What do you want to search for?')
    return
  endif

  call setqflist([])
  execute 'silent grep!' a:args
  " The quickfix window must occupy the full width.
  botright copen

  let results_count = len(getqflist())
  if results_count == 0
    execute ('cclose')
    redraw!
    " echo printf('No matches found for "%s"', a:args)
    call s:warn('No matches found for "' . a:args . '"')
    return
  endif

  redraw!
  let w:quickfix_title = 'Found ' . results_count . ' matches for "' . a:args . '"'
endfunction

function! s:warn(msg)
  echohl WarningMsg
  echomsg a:msg
  echohl NONE
endfunction

function! s:error(msg)
  echohl ErrorMsg
  echomsg a:msg
  echohl NONE
endfunction
