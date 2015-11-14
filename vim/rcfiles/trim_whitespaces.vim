" ----------------------------------------------------------------------------
" Trimmer
" ----------------------------------------------------------------------------
" Strip trailing spaces throughout an entire file, everytime it is saved.
if exists('g:loaded_trimmer')
  finish
endif

let g:loaded_trimmer = 1

function! s:StripTrailingWhitespace()
  " Preparation: save last search, and cursor position.
  let _s=@/
  let l = line(".")
  let c = col(".")
  " Do the business:
  %s/\s\+$//e
  " Clean up: restore previous search history, and cursor position.
  let @/=_s
  call cursor(l, c)
endfunction

" Run the previous command automatically when a file is saved.
autocmd BufWritePre * :call s:StripTrailingWhitespace()
